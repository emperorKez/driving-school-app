import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_bottom_bar.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/nav/router.dart';
import 'package:korbil_mobile/pages/app_home/cubit/tab_view/tab_view_bloc.dart';
import 'package:korbil_mobile/pages/app_home/views/tabs/lesson_tab_view.dart';
import 'package:korbil_mobile/pages/app_home/views/tabs/notification_tab_view.dart';
import 'package:korbil_mobile/pages/app_home/views/tabs/school_tab_view.dart';
import 'package:korbil_mobile/pages/app_home/views/tabs/student_tab_view.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/staff/staff_bloc.dart';
import 'package:korbil_mobile/pages/school/views/manage_school/views/manage_school.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class AppHomePage extends StatelessWidget {
  const AppHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocConsumer<StaffBloc, StaffState>(
        listener: (context, state) {
          if (state is StaffError) {
            errorSnackbar(context, error: state.error);
          }
        },
        builder: (context, state) {
          if (context.read<SchoolBloc>().state.schoolInfo != null) {
            return BlocProvider(
              create: (context) => TabViewBloc(),
              child: const _AppHome(),
            );
          } else if (state is! StaffLoaded) {
            return kLoadingWidget(context);
          } else {
            context
                .read<SchoolBloc>()
                .add(GetSchool(schoolId: state.staff!.staffData.schoolId));

            return BlocProvider(
              create: (context) => TabViewBloc(),
              child: const _AppHome(),
            );
          }
        },
      ),
    );
  }
}

class _AppHome extends StatefulWidget {
  const _AppHome();

  @override
  State<_AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<_AppHome> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabViewBloc, TabViewState>(
      buildWhen: (previous, current) => previous.index != current.index,
      builder: (context, state) {
        return PopScope(
          onPopInvoked: (pop) {
            if (state is LessonTabViewState) {
              if (lessonsNavKey.currentState!.canPop()) {
                lessonsNavKey.currentState!.pop();
              } else {
                rootNavKey.currentState!.pop();
              }
            } else if (state is StudentTabViewState) {
              if (studentsNavKey.currentState!.canPop()) {
                studentsNavKey.currentState!.pop();
              } else {
                rootNavKey.currentState!.pop();
              }
            } else if (state is NotificationTabViewState) {
              if (notificationsNavKey.currentState!.canPop()) {
                notificationsNavKey.currentState!.pop();
              } else {
                rootNavKey.currentState!.pop();
              }
            } else {
              if (schoolNavKey.currentState!.canPop()) {
                schoolNavKey.currentState!.pop();
              } else {
                rootNavKey.currentState!.pop();
              }
            }
            // return Future.value(false);
          },
          child: BlocConsumer<SchoolBloc, SchoolState>(
            listener: (context, state) {
              if (state is SchoolError) {
                errorSnackbar(context, error: state.error);
              }
              // if (state is SchoolLoaded && state.schoolInfo!.schoolStatus !=5){
              //   Navigator.of(context).pushReplacement(
              //     MaterialPageRoute<dynamic>(
              //         builder: (context) => const AppHomePage()));
              // }
            },
            builder: (context, state) {
              if (state is! SchoolLoaded) {
                return kLoadingWidget(context);
              } else {
                return state.schoolInfo!.schoolStatus == 5
                    ? const _AppHomeBody()
                    : const ManageSchoolView();
                // return const _AppHomeBody();
              }
            },
          ),
        );
      },
    );
  }
}

class _AppHomeBody extends StatelessWidget {
  const _AppHomeBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar:
          getPreferedOrientation(context) == PreferedOrientation.landscape
              ? null
              : const PrimaryBottomAppBar(),
      body: BlocBuilder<TabViewBloc, TabViewState>(
        buildWhen: (previous, current) => previous.index != current.index,
        builder: (context, state) {
          return Row(
            children: [
              if (getPreferedOrientation(context) ==
                  PreferedOrientation.landscape)
                const SizedBox(
                  width: 60,
                  child: PrimarySideBar(),
                )
              else
                Container(),
              Expanded(
                child: IndexedStack(
                  index: state.index,
                  children: const [
                    LessonTabView(),
                    StudentTabView(),
                    NotificationTabView(),
                    SchoolTabView(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

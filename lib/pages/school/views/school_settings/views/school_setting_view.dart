import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/pages/school/bloc/course/course_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/package/package_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/promotion/promotion_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/review/review_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/school_location/school_location_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/vehicle/vehicle_bloc.dart';
import 'package:korbil_mobile/pages/school/views/school_settings/bloc/tab_menu/tab_menu_bloc.dart';
import 'package:korbil_mobile/pages/school/views/school_settings/views/main_widget.dart';
import 'package:korbil_mobile/pages/school/views/school_settings/views/selected_tab.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class SchoolSettingsView extends StatelessWidget {
  const SchoolSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabMenuBloc(),
      child: const _SchoolSettingsView(),
    );
  }
}

class _SchoolSettingsView extends StatefulWidget {
  const _SchoolSettingsView();

  @override
  State<_SchoolSettingsView> createState() => _SchoolSettingsViewState();
}

class _SchoolSettingsViewState extends State<_SchoolSettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SchoolBloc, SchoolState>(
        listener: (context, state) {
          

          if (state is SchoolError) {
            errorSnackbar(context, error: state.error);
          }
        },
        builder: (context, state) {
          if (state is! SchoolLoaded) {
            return kLoadingWidget(context);
          } else {
            context
                .read<PackageBloc>()
                .add(GetPackages(schoolId: state.schoolInfo!.id));
                context
                .read<ReviewBloc>()
                .add(GetReviews(schoolId: state.schoolInfo!.id));
                context
                .read<SchoolLocationBloc>()
                .add(GetLocations(schoolId: state.schoolInfo!.id));
                context
                .read<VehicleBloc>()
                .add(GetVehicles(schoolId: state.schoolInfo!.id));

                //check if school is active
            if (state.schoolInfo!.schoolStatus == 5){
            context
                .read<CourseBloc>()
                .add(GetCourses(schoolId: state.schoolInfo!.id));
            context
                .read<PromotionBloc>()
                .add(GetPromotions(schoolId: state.schoolInfo!.id));
            
            
            
            
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: getPreferedOrientation(context) ==
                      PreferedOrientation.landscape
                  ? const Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: MainWidget(),
                        ),
                        Expanded(
                          flex: 3,
                          child: SelectedTab(),
                        ),
                      ],
                    )
                  : const MainWidget(),
            );
          }
        },
      ),
    );
  }
}

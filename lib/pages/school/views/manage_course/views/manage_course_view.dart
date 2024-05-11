import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/pages/school/bloc/staff/staff_bloc.dart';
import 'package:korbil_mobile/pages/school/views/manage_course/views/profile_section.dart';
import 'package:korbil_mobile/pages/school/views/manage_course/views/student_card.dart';
import 'package:korbil_mobile/pages/school/views/manage_course/views/total_lessons.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class InstManageCourseView extends StatefulWidget {
  const InstManageCourseView({super.key});

  @override
  State<InstManageCourseView> createState() => _InstManageCourseViewState();
}

class _InstManageCourseViewState extends State<InstManageCourseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getPreferedOrientation(context) == PreferedOrientation.landscape
          ? null
          : AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text(
                'Users',
                style: TextStyle(
                  fontFamily: 'Lato',
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              leading: const InstAppBarBackBtn(),
              actions: const [
                _AppBarMenu(),
              ],
            ),
      body: BlocBuilder<StaffBloc, StaffState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const ProfileSection(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TotalLessons(
                      text: 'Total lessons',
                      val: state.stat!.totalCompletedLessons.toString(),
                      icon: 'assets/imgs/ins/school/lesson_vid.png',
                    ),
                    TotalLessons(
                      text: 'Working hours',
                      val: state.stat!.totalWorkingHrs.toString(),
                      icon: 'assets/imgs/ins/school/clock.png',
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TotalLessons(
                      text: 'Ongoing lessons',
                      val: state.stat!.assignedLessons.toString(),
                    ),
                    TotalLessons(
                      text: 'Future assigned',
                      val: state.stat!.scheduledLessons.toString(),
                    ),
                    TotalLessons(
                      text: 'Total KMs',
                      val: state.stat!.totalDistanceKms.toString(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Top Students',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (state.topStudents != null && state.topStudents!.isNotEmpty)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                        state.topStudents!.length,
                        (index) =>
                            StudentCard(student: state.topStudents![index])),
                  ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _AppBarMenu extends StatelessWidget {
  const _AppBarMenu();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      splashRadius: 8,
      onSelected: (value) {
        switch (value) {
          case 'Change user type':
          // context.read<ProfileBloc>().add(ChangeUserType());
          case 'Deactivate user':
          // context.read<ProfileBloc>().add(DeactivateUser());
          default:
        }
      },
      itemBuilder: (ctx) => const [
        PopupMenuItem<String>(
          value: 'Change user type',
          child: Text(
            'Change user type',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: 'Deactivate user',
          child: Text(
            'Deactivate user',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }
}

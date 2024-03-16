import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/pages/school/bloc/course/course_bloc.dart';
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
      body: BlocBuilder<CourseBloc, CourseState>(
        builder: (context, state) {
          var totalDuration = 0;
          var totalActive = 0;
          var totalFutureAssigned = 0;

          for (final element in state.courses!) {
            totalDuration += element.course.timeDuration;
            if (element.course.isActive) totalActive++;
            if (element.courseCategory.id == 1) totalFutureAssigned++;
          }
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
                      val: state.courses!.length.toString(),
                      icon: 'assets/imgs/ins/school/lesson_vid.png',
                    ),
                    TotalLessons(
                      text: 'Working hours',
                      val: totalDuration.toString(),
                      icon: 'assets/imgs/ins/school/clock.png',
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TotalLessons(
                      text: 'Ongoing lessons',
                      val: totalActive.toString(),
                    ),
                    TotalLessons(
                      text: 'Future assigned',
                      val: totalFutureAssigned.toString(),
                    ),
                    const TotalLessons(
                      text: 'Total KMs',
                      val: '22',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Top 3 Students',
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
                const StudentCard(),
                const StudentCard(),
                const StudentCard(),
                const StudentCard(),
                const StudentCard(),
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

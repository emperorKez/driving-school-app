// ignore_for_file: always_use_package_imports

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/custom_screen_padding.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/pages/school/bloc/course/course_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/students/bloc/package_cubit/package_cubit.dart';
import 'package:korbil_mobile/pages/students/views/manage_student_lesson/views/manage_student_lesson.dart';
import 'package:korbil_mobile/pages/students/views/profile_package_history/views/profile_package_history.dart';
import 'package:korbil_mobile/repository/student/models/school_student.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

import 'feedback_card.dart';
import 'inst_list.dart';
import 'lesson_detail_card.dart';
import 'profile_section.dart';
import 'stat_progress_item.dart';
import 'stats.dart';

class StudentProfileApproved extends StatelessWidget {
  const StudentProfileApproved({required this.student, super.key});
  final CurrentStudent student;

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    context.read<PackageCubit>().getStudentPackage(student.id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Lato',
            color: KorbilTheme.of(context).secondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: const InstAppBarBackBtn(),
        actions: const [_AppBarAction()],
      ),
      body: BlocConsumer<PackageCubit, PackageState>(
        listener: (context, state) {
          if (state is PackageError) {
            errorSnackbar(context, error: 'Something went wrong');
          }
        },
        builder: (context, state) {
          // if (state is PackageInitial) {
          //   context.read<PackageCubit>().getStudentPackage(student.id);
          // }
          return state is! PackageLoaded
              ? kLoadingWidget(context)
              : getPreferedOrientation(context) == PreferedOrientation.landscape
                  ? Row(
                      children: [
                        Expanded(
                          child: _buildLandscapeLeft(
                            context,
                            s,
                            state: state,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: _buildLandscapeRight(context, state: state),
                        ),
                      ],
                    )
                  : ListView(
                      shrinkWrap: true,
                      children: [
                        _buildLandscapeLeft(context, s, state: state),
                        const SizedBox(height: 35),
                        _buildLandscapeRight(context, state: state),
                        const SizedBox(height: 50),
                      ],
                    );
        },
      ),
    );
  }

  Widget _buildLandscapeRight(
    BuildContext context, {
    required PackageState state,
  }) {
    return ListView(
      shrinkWrap: true,
      children: [
        CustomScreenPadding(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Instructor comments',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: KorbilTheme.of(context).secondaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                width: 50,
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: KorbilTheme.of(context).primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const CustomScreenPadding(
          child: InstFeedBackCard(), //todo feedback api is not available
        ),
        const SizedBox(height: 20),
        CustomScreenPadding(
          child: Text(
            'Recent Lessons',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).secondaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: state.studentPackage!.pastLessons.isEmpty
              ? []
              : List.generate(
                  state.studentPackage!.pastLessons.length,
                  (index) => CustomScreenPadding(
                    child: LessonDetailCard(
                      title: context
                          .read<CourseBloc>()
                          .state
                          .courses![context
                              .read<CourseBloc>()
                              .state
                              .courses!
                              .indexWhere(
                                (e) =>
                                    e.course.id ==
                                    state.studentPackage!.pastLessons[index]
                                        .courseId,
                              )]
                          .course
                          .title,
                      subTitle:
                          '${state.studentPackage!.pastLessons[index].scheduledDate}',
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildLandscapeLeft(
    BuildContext context,
    Size s, {
    required PackageState state,
  }) {
    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(height: 30),
        ProfileSection(
          studentId: student.id,
        ),
        const SizedBox(height: 25),
        StatsView(
          stats: state.studentPackage!.stats,
        ),
        const SizedBox(height: 10),
        PrimaryBtn(
          ontap: () {
            if (state.studentPackage != null) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (cxt) => ManageStudentLesson(
                    studentPackage: state.studentPackage!,
                    studentId: student.id,
                  ),
                ),
              );
            }
          },
          text: 'Manage Lessons',
          fontSize: 14,
          hm: 25,
        ),
        Container(
          width: double.infinity,
          height:
              getPreferedOrientation(context) == PreferedOrientation.landscape
                  ? null
                  : 80,
          margin: const EdgeInsets.symmetric(vertical: 12),
          child:
              const InstructorsList(), //todo student cannot be linked to an istructor for now
        ),
        const SizedBox(height: 15),
        CustomScreenPadding(
          child: Text(
            'Student statistics',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).secondaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 10),
        BlocBuilder<CourseBloc, CourseState>(
          builder: (context, courseState) {
            if (courseState is CourseInitial) {
              context.read<CourseBloc>().add(
                    GetCourses(
                      schoolId: context.read<SchoolBloc>().state.schoolInfo!.id,
                    ),
                  );
            }
            return courseState is! CourseLoaded
                ? kLoadingWidget(context)
                // : state.studentPackage!.upcomingLessons.isEmpty
                //     ? Text('No upcoming Lessono')
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      state.studentPackage!.upcomingLessons.length,
                      (index) => StatProgressItem(
                        s: s,
                        title: courseState
                            .courses![courseState.courses!.indexWhere(
                          (e) =>
                              e.course.id ==
                              state.studentPackage!.upcomingLessons[index]
                                  .courseId,
                        )]
                            .course
                            .title,
                        progress: state
                            .studentPackage!.upcomingLessons[index].progress,
                      ),
                    ),
                  );
          },
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}

class _AppBarAction extends StatelessWidget {
  const _AppBarAction();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<dynamic>(
            builder: (_) => const ProfilePackageHistory(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Image.asset(
          'assets/imgs/ins/profile/gear.png',
          width: 22,
        ),
      ),
    );
  }
}

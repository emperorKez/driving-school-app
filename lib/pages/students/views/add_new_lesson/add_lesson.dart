import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/custom_screen_padding.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/pages/school/bloc/course/course_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/staff/staff_bloc.dart';
import 'package:korbil_mobile/pages/students/bloc/upcoming_lesson/upcoming_lesson_bloc.dart';
import 'package:korbil_mobile/repository/course/model/course.dart';
import 'package:korbil_mobile/theme/theme.dart';

class ManageLessonAddLessonView extends StatefulWidget {
  const ManageLessonAddLessonView(
      {required this.studentId, required this.packageId, super.key,});
  final int studentId;
  final int packageId;

  @override
  State<ManageLessonAddLessonView> createState() =>
      _ManageLessonAddLessonViewState();
}

class _ManageLessonAddLessonViewState extends State<ManageLessonAddLessonView> {
  final addedLesson = <Course>{};

  @override
  Widget build(BuildContext context) {
    final schoolId = context.read<SchoolBloc>().state.schoolInfo!.id;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Add Lessons',
          style: TextStyle(
            fontFamily: 'Lato',
            color: KorbilTheme.of(context).secondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: const InstAppBarBackBtn(),
      ),
      body: CustomScreenPadding(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<CourseBloc, CourseState>(
              builder: (context, state) {
                if (state is CourseInitial) {
                  context
                      .read<CourseBloc>()
                      .add(GetCourses(schoolId: schoolId));
                }
                if (state is! CourseLoaded) {
                  return kLoadingWidget(context);
                } else {
                  return state.courses == null || state.courses!.isEmpty
                      ? const Center(
                          child: Text('No course Available'),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.courses!.length,
                          itemBuilder: (context, index) =>
                              lessonDataCard(state.courses![index]),
                        );
                }
              },
            ),
            const SizedBox(height: 50,),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      decoration: BoxDecoration(
                        color: KorbilTheme.of(context).white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: KorbilTheme.of(context).secondaryColor,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Close',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: KorbilTheme.of(context).secondaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: BlocConsumer<UpcomingLessonBloc, UpcomingLessonState>(
                    listener: (context, state) {
                      if (state is UpcomingLessonLoaded) {
                        Navigator.pop(context);
                      }
                      if (state is UpcomingLessonError) {
                        errorSnackbar(context, error: state.error);
                      }
                    },
                    builder: (context, state) {
                      return state is UpcomingLessonLoading
                          ? kLoadingWidget(context)
                          : PrimaryBtn(
                              ontap: () {
                                final staffId = context
                                    .read<StaffBloc>()
                                    .state
                                    .staff!
                                    .profile
                                    .id;
                                final schoolId = context
                                    .read<SchoolBloc>()
                                    .state
                                    .schoolInfo!
                                    .id;
                                if (addedLesson.isNotEmpty) {
                                  final payload = {
                                    'schoolPackageId': widget.packageId,
                                    'studentId': widget.studentId,
                                    'staffId': staffId,
                                    'schoolId': schoolId,
                                    'courseIdList': [
                                      for (final item in addedLesson)
                                        item.course.id,
                                    ],
                                  };
                                  context.read<UpcomingLessonBloc>().add(
                                      AddLesson(
                                          payload: payload,
                                          studentId: widget.studentId,
                                          packageId: widget.packageId,),);
                                }
                              },
                              text: 'Add',
                              vm: 0,
                              hm: 0,
                              fontSize: 14,
                            );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget lessonDataCard(Course course) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: KorbilTheme.of(context).alternate1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 12, top: 5),
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: KorbilTheme.of(context).primaryColor,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/imgs/ins/lessons/traffic_lights.png',
                    width: 35,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.course.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: KorbilTheme.of(context).secondaryColor,
                      ),
                    ),
                    Text(
                      'Duration : ${course.course.timeDuration} min',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: KorbilTheme.of(context).secondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          addedLesson.add(course);
                          // _number += 1;
                        });
                      },
                      child: Text(
                        '+',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w800,
                          fontSize: 28,
                          color: KorbilTheme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: KorbilTheme.of(context).secondaryColor,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          addedLesson.contains(course) ? '1' : '0',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: KorbilTheme.of(context).secondaryColor,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          addedLesson.remove(course);
                        });
                      },
                      child: Text(
                        '-',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w800,
                          fontSize: 28,
                          color: KorbilTheme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

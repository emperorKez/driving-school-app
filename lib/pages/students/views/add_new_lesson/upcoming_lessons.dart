// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/pages/school/bloc/course/course_bloc.dart';
import 'package:korbil_mobile/pages/students/bloc/upcoming_lesson/upcoming_lesson_bloc.dart';
import 'package:korbil_mobile/repository/lesson/model/upcoming_lesson.dart';
import 'package:korbil_mobile/theme/theme.dart';

class UpcomingLessonsListWidget extends StatelessWidget {
  const UpcomingLessonsListWidget({
    required this.packageId,
    required this.studentId,
    super.key,
  });
  final int packageId;
  final int studentId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingLessonBloc, UpcomingLessonState>(
      builder: (context, state) {
        if (state is UpcomingLessonInitial) {
          context
              .read<UpcomingLessonBloc>()
              .add(GetLessons(studentId: studentId, packageId: packageId));
        }
        if (state is! UpcomingLessonLoaded) {
          return kLoadingWidget(context);
        } else {
          return state.lesson == null || state.lesson!.isEmpty
              ? const SizedBox()
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.lesson!.length,
                  itemBuilder: (cxt, index) => _UpcomingLessonTypeCard(
                    lesson: state.lesson![index],
                  ),
                );
        }
      },
    );
  }
}

class _UpcomingLessonTypeCard extends StatefulWidget {
  const _UpcomingLessonTypeCard({
    required this.lesson,
  });
  final UpcomingLesson lesson;

  @override
  State<_UpcomingLessonTypeCard> createState() =>
      _UpcomingLessonTypeCardState();
}

class _UpcomingLessonTypeCardState extends State<_UpcomingLessonTypeCard> {
  @override
  Widget build(BuildContext context) {
    final packageId = widget.lesson.lesson.schoolPackageId;
    final studentId = widget.lesson.lesson.studentId;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (cxt) {
                context.read<UpcomingLessonBloc>().add(DeleteLesson(
                    lessonId: widget.lesson.lesson.id,
                    studentId: studentId,
                    packageId: packageId,),);
              },
              label: 'Remove',
              foregroundColor: KorbilTheme.of(context).white,
              backgroundColor: KorbilTheme.of(context).warningColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: KorbilTheme.of(context).alternate1),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  Text(
                    'Enable for booking',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: KorbilTheme.of(context).secondaryColor,
                    ),
                  ),
                  Switch(
                    value: widget.lesson.lesson.enabledBooking,
                    onChanged: (val) {
                      val
                          ? context.read<UpcomingLessonBloc>().add(
                              EnableLessonBooking(
                                  lessonId: widget.lesson.lesson.id,
                                  studentId: studentId,
                                  packageId: packageId,),)
                          : context.read<UpcomingLessonBloc>().add(
                              DisableLessonBooking(
                                  lessonId: widget.lesson.lesson.id,
                                  studentId: studentId,
                                  packageId: packageId,),);
                    },
                    activeColor: KorbilTheme.of(context).primaryColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<CourseBloc, CourseState>(
                          builder: (context, state) {
                            return state is! CourseLoaded
                                ? kLoadingWidget(context)
                                : Text(
                                    state
                                        .courses![state.courses!.indexWhere(
                                            (e) =>
                                                e.course.id ==
                                                widget.lesson.lesson.courseId,)]
                                        .course
                                        .title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: KorbilTheme.of(context)
                                          .secondaryColor,
                                    ),
                                  );
                          },
                        ),
                        Text(
                          'Start Date: ${widget.lesson.lesson.scheduledDate}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: KorbilTheme.of(context).secondaryColor,
                          ),
                        ),
                        Text(
                          'Duration : ${widget.lesson.lesson.duration}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: KorbilTheme.of(context).secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Image.asset(
                      'assets/imgs/ins/profile/add_task_green.png',
                      width: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pick up location:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: KorbilTheme.of(context).secondaryColor,
                          ),
                        ),
                        Text(
                          widget.lesson.location.address,
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
                    margin: const EdgeInsets.only(top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/imgs/ins/profile/scheduled.png',
                          width: 25,
                        ),
                        Text(
                          '${widget.lesson.lesson.scheduledTime}',
                          // '----/--/--',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: KorbilTheme.of(context).secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

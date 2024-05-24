import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/box_shadow/default_box_shadow.dart';
import 'package:korbil_mobile/pages/school/bloc/course/course_bloc.dart';
import 'package:korbil_mobile/repository/student/models/student_package.dart';
import 'package:korbil_mobile/theme/theme.dart';

class InstHIstoryItemCard extends StatelessWidget {
  const InstHIstoryItemCard({
    required this.lesson,
    super.key,
  });
  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    final course = context
        .read<CourseBloc>()
        .state
        .courses![context
            .read<CourseBloc>()
            .state
            .courses!
            .indexWhere((e) => e.course.id == lesson.courseId)]
        .course;
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [defaultBoxShadow()],
        color: KorbilTheme.of(context).white,
        border: Border.all(color: KorbilTheme.of(context).alternate1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 55,
                height: 55,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(right: 15, left: 10),
                decoration: BoxDecoration(
                  color: KorbilTheme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(6),
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
                    Text(
                      course.title,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: KorbilTheme.of(context).secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Completed Date:${lesson.scheduledDate}',
                      // 'Completed Date:${DateFormat.yMMMd().format(lesson.scheduledDate)}',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: KorbilTheme.of(context).secondaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Duration : ${lesson.duration}',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: KorbilTheme.of(context).secondaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 15, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'distance',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: KorbilTheme.of(context).secondaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${lesson.distance}',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: KorbilTheme.of(context).secondaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/imgs/ins/lessons/done_tasks_green.png',
                      width: 24,
                    ),
                    Text(
                      'Finished',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: KorbilTheme.of(context).secondaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
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

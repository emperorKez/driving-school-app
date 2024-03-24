import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:korbil_mobile/repository/lesson/model/lesson.dart';
import 'package:korbil_mobile/theme/theme.dart';

class AssignementDetailSection extends StatelessWidget {
  const AssignementDetailSection({ required this.detail,
    super.key,
  });
  final LessonDetail detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: KorbilTheme.of(context).white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: KorbilTheme.of(context).alternate2,
            blurRadius: 3,
            spreadRadius: 3,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Class Assignment',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: KorbilTheme.of(context).secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/imgs/ins/lessons/done_tasks_green.png',
                          width: 24,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Finished',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: KorbilTheme.of(context).secondaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: KorbilTheme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/imgs/ins/lessons/notebook.png',
                          width: 34,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Distance : ',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: KorbilTheme.of(context).secondaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '${detail.lesson.distance}',
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: VerticalDivider(
                    thickness: 2,
                    width: 2,
                    indent: 5,
                    endIndent: 5,
                    color:
                        KorbilTheme.of(context).secondaryColor.withOpacity(0.5),
                  ),
                ),
                Expanded(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Instructor : ',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: KorbilTheme.of(context).secondaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '${detail.staff.firstName} ${detail.staff.lastName}',
                        textAlign: TextAlign.center,
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
                // keep this just for the layout padding
                // Opacity(
                //   opacity: 0,
                //   child: Container(
                //     padding: const EdgeInsets.symmetric(horizontal: 15),
                //     child: VerticalDivider(
                //       thickness: 2,
                //       width: 2,
                //       indent: 5,
                //       endIndent: 5,
                //       color: AppColors.black.withOpacity(0.5),
                //     ),
                //   ),
                // ),
                // Expanded(
                //   child: Container(),
                // ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date :',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: KorbilTheme.of(context).secondaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        DateFormat.yMd().format(detail.lesson.scheduledDate),
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: VerticalDivider(
                    thickness: 2,
                    width: 2,
                    indent: 5,
                    endIndent: 5,
                    color:
                        KorbilTheme.of(context).secondaryColor.withOpacity(0.5),
                  ),
                ),
                Expanded(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Time :',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: KorbilTheme.of(context).secondaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        DateFormat.Hm().format(detail.lesson.scheduledTime as DateTime),
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: VerticalDivider(
                    thickness: 2,
                    width: 2,
                    indent: 5,
                    endIndent: 5,
                    color:
                        KorbilTheme.of(context).secondaryColor.withOpacity(0.5),
                  ),
                ),
                Expanded(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Duration :',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: KorbilTheme.of(context).secondaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '${detail.lesson.duration}',
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
          ),
          const SizedBox(height: 20),
          Text(
            'Pick up location',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).secondaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            detail.location.address,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).secondaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:korbil_mobile/theme/theme.dart';

class ManageStudentLessonTypeCard extends StatelessWidget {
  const ManageStudentLessonTypeCard({
    required this.hoursCount,
    required this.lessonCount,
    required this.selected,
    required this.type,
    required this.ontap,
    super.key,
  });

  final int lessonCount;
  final double hoursCount;
  final int type;
  final bool selected;
  final void Function() ontap;

  Widget _generateIcon() {
    var path = 'assets/imgs/ins/profile/upcoming_lessons_icon_white.png';
    if (selected) {
      if (type == 1) {
        path = 'assets/imgs/ins/profile/upcoming_lessons_icon_white.png';
      } else {
        path = 'assets/imgs/ins/profile/completed_lessons_white.png';
      }
    } else {
      if (type == 1) {
        path = 'assets/imgs/ins/profile/upcoming_lessons_icon_green.png';
      } else {
        path = 'assets/imgs/ins/profile/completed_lessons_green.png';
      }
    }
    return Image.asset(
      path,
      width: 25,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      // () {
      // ontap;
      // ontap(type);
      // },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: selected
              ? KorbilTheme.of(context).primaryColor
              : KorbilTheme.of(context).white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: KorbilTheme.of(context).primaryColor,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: _generateIcon(),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        type == 1 ? 'Upcoming' : 'Completed',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: selected
                              ? KorbilTheme.of(context).white
                              : KorbilTheme.of(context).secondaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '$lessonCount',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: selected
                              ? KorbilTheme.of(context).white
                              : KorbilTheme.of(context).secondaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        type == 1 ? 'Hours left' : 'Total Hours',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: selected
                              ? KorbilTheme.of(context).white
                              : KorbilTheme.of(context).secondaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '$hoursCount',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: selected
                              ? KorbilTheme.of(context).white
                              : KorbilTheme.of(context).secondaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

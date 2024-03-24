import 'package:flutter/material.dart';
import 'package:korbil_mobile/pages/lessons/views/completed_lesson_details/views/assesment_type_icon.dart';
import 'package:korbil_mobile/pages/lessons/views/completed_lesson_details/views/selected_bad_assesment_card.dart';
import 'package:korbil_mobile/repository/lesson/model/lesson.dart';
import 'package:korbil_mobile/theme/theme.dart';

class BadAtSection extends StatelessWidget {
  const BadAtSection({ required this.detail,
    required String needToPracticeAssesment, super.key,
  }) : _needToPracticeAssesment = needToPracticeAssesment;

  final String _needToPracticeAssesment;
  final LessonDetail detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Bad At',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: KorbilTheme.of(context).secondaryColor,
              ),
            ),
            const SizedBox(width: 10),
            Icon(
              Icons.thumb_down,
              color: KorbilTheme.of(context).secondaryColor,
              size: 18,
            ),
          ],
        ),
        const SizedBox(height: 25),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child:  BadAssestmentTypeIcon(
                  type: 'Vehicle knowledge',
                  selected: _needToPracticeAssesment == 'Vehicle knowledge',
                  ontap: (String val) {
                    // setState(() {
                    //   _needToPracticeAssesment = val;
                    // });
                  },
                ),
              ),
              Expanded(
                child: BadAssestmentTypeIcon(
                  type: 'Road safety and behavior',
                  selected:
                      _needToPracticeAssesment == 'Road safety and behavior',
                  ontap: (String val) {
                    // setState(() {
                    //   _needToPracticeAssesment = val;
                    // });
                  },
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        // assessment details
        SelectedBadAssementDetailCard(
          selectedGoodAssesment: _needToPracticeAssesment,
        ),
      ],
    );
  }
}

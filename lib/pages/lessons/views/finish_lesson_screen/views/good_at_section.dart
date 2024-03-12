import 'package:flutter/material.dart';
import 'package:korbil_mobile/pages/lessons/views/finish_lesson_screen/views/good_assessment_card.dart';
import 'package:korbil_mobile/pages/lessons/views/inst_lesson_details/views/inst_lesson_details.dart';
import 'package:korbil_mobile/theme/theme.dart';

class GoodAtSection extends StatelessWidget {
  const GoodAtSection({
    required String selectedGoodAssesment, super.key,
  }) : _selectedGoodAssesment = selectedGoodAssesment;

  final String _selectedGoodAssesment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Good At',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: KorbilTheme.of(context).secondaryColor,
              ),
            ),
            const SizedBox(width: 10),
            Icon(
              Icons.thumb_up,
              color: KorbilTheme.of(context).primaryColor,
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
                child: AssestmentTypeIcon(
                  type: 'Maneuvering',
                  selected: _selectedGoodAssesment == 'Maneuvering',
                  ontap: (String val) {
                    // setState(() {
                    //   _selectedGoodAssesment = val;
                    // });
                  },
                ),
              ),
              Expanded(
                child: AssestmentTypeIcon(
                  type: 'Eco-friendly driving',
                  selected: _selectedGoodAssesment == 'Eco-friendly driving',
                  ontap: (String val) {
                    // setState(() {
                    //   _selectedGoodAssesment = val;
                    // });
                  },
                ),
              ),
              Expanded(
                child: AssestmentTypeIcon(
                  type: 'Rules of the road',
                  selected: _selectedGoodAssesment == 'Rules of the road',
                  ontap: (String val) {
                    // setState(() {
                    //   _selectedGoodAssesment = val;
                    // });
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        // assessment details
        SelectedGoodAssementDetailCard(
          selectedGoodAssesment: _selectedGoodAssesment,
        ),
      ],
    );
  }
}

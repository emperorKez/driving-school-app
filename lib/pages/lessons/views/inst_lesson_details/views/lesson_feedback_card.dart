import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/box_shadow/default_box_shadow.dart';
import 'package:korbil_mobile/theme/theme.dart';

class InstLessonFeedbackCard extends StatelessWidget {
  const InstLessonFeedbackCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: KorbilTheme.of(context).white,
        boxShadow: [defaultBoxShadow()],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Jack Martines',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Image.asset(
                'assets/imgs/ins/lessons/shield_black.png',
                width: 22,
              ),
              const Spacer(),
              Image.asset(
                'assets/imgs/ins/lessons/bin.png',
                width: 24,
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/imgs/ins/lessons/add_review.png',
                width: 24,
              ),
              const SizedBox(
                width: 12,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget feugiat quis facilisis metus amet id pellentesque volutpat.',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: KorbilTheme.of(context).secondaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

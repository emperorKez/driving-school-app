import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/box_shadow/default_box_shadow.dart';
import 'package:korbil_mobile/theme/theme.dart';

class LessonDetailCard extends StatelessWidget {
  const LessonDetailCard(
      {required this.subTitle, required this.title, super.key});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      decoration: BoxDecoration(
          color: KorbilTheme.of(context).white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [defaultBoxShadow()]),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, right: 15),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: KorbilTheme.of(context).primaryColor,
            ),
            child: Center(
              child: Image.asset(
                'assets/imgs/ins/lessons/traffic_lights.png',
                width: 20,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: KorbilTheme.of(context).secondaryColor,
                    ),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: KorbilTheme.of(context).secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 60,
            child: Text(
              '60 min',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: KorbilTheme.of(context).secondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

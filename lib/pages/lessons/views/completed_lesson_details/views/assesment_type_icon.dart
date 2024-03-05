import 'package:flutter/material.dart';
import 'package:korbil_mobile/theme/theme.dart';

class BadAssestmentTypeIcon extends StatelessWidget {
  const BadAssestmentTypeIcon({
    required this.selected,
    required this.type,
    required this.ontap,
    super.key,
  });
  final bool selected;
  final String type;
  final Function ontap;

  String _getAssesmentTypeImg(String type) {
    switch (type) {
      case 'Vehicle knowledge':
        if (selected) {
          return 'assets/imgs/ins/lessons/shield.png';
        } else {
          return 'assets/imgs/ins/lessons/shield_black.png';
        }
      case 'Road safety and behavior':
        if (selected) {
          return 'assets/imgs/ins/lessons/road_safety_white.png';
        } else {
          return 'assets/imgs/ins/lessons/road_safety_black.png';
        }

      default:
        return 'assets/imgs/ins/lessons/shield.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap(type);
      },
      child: Column(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: KorbilTheme.of(context).secondaryColor,
              ),
              borderRadius: BorderRadius.circular(6),
              color: selected
                  ? KorbilTheme.of(context).secondaryColor
                  : KorbilTheme.of(context).white,
            ),
            child: Center(
              child: Image.asset(
                _getAssesmentTypeImg(type),
                width: 28,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            type,
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
    );
  }
}

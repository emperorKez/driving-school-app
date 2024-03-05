import 'package:flutter/material.dart';
import 'package:korbil_mobile/global/constants/colors.dart';

abstract class KorbilTypography {
  String get family1;
  String get family2;

  TextStyle getTextStyle();
}

class AppTypoGraphy extends KorbilTypography {
  static const _family1 = 'Lato';
  static const _family2 = 'Poppins';

  @override
  String get family1 => _family1;

  @override
  String get family2 => _family2;

  @override
  TextStyle getTextStyle({
    String family = _family2,
    double fontSize = 16,
    FontWeight weight = FontWeight.normal,
    Color color = AppColors.black,
  }) =>
      TextStyle(
        fontFamily: family,
        fontSize: fontSize,
        fontWeight: weight,
        color: color,
      );
}

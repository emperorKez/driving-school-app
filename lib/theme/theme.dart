import 'package:flutter/material.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/theme/typography.dart';

abstract class KorbilTheme {
  static KorbilTheme of(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    if (isDarkMode) {
      return LightModeTheme();
    }
    return LightModeTheme();
  }

  late Color primaryColor;
  late Color secondaryColor;
  late Color alternate1;
  late Color alternate2;
  late Color primaryBg;
  late Color secondaryBg;
  late Color warningColor;
  late Color white;

  String get family1 => typography.family1;
  String get family2 => typography.family2;

  KorbilTypography get typography => AppTypoGraphy();
}

class LightModeTheme extends KorbilTheme {
  @override
  Color get primaryColor => AppColors.green;
  @override
  Color get secondaryColor => AppColors.black;
  @override
  Color get warningColor => AppColors.red;
  @override
  Color get alternate1 => AppColors.grey1;
  @override
  Color get alternate2 => AppColors.grey2;
  @override
  Color get white => AppColors.white;
  @override
  Color get primaryBg => AppColors.white;
  @override
  Color get secondaryBg => AppColors.bgSecondary;
}

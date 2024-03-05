import 'package:flutter/material.dart';
import 'package:korbil_mobile/global/constants/colors.dart';

BoxShadow defaultBoxShadow() {
  return const BoxShadow(
    color: AppColors.grey2,
    blurRadius: 3,
    spreadRadius: 3,
    offset: Offset(2, 2),
  );
}

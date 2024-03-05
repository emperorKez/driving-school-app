import 'package:flutter/material.dart';
import 'package:korbil_mobile/global/constants/colors.dart';

class SecondaryBtn extends StatelessWidget {
  const SecondaryBtn({
    required this.text,
    this.ontap,
    this.vm = 15,
    this.hm = 30,
    this.borderColor = AppColors.green,
    this.fontSize = 20,
    this.textColor = AppColors.green,
    super.key,
  });
  final String text;
  final Function? ontap;
  final double vm, hm;
  final Color borderColor;
  final double fontSize;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (ontap != null) {
          // ignore: avoid_dynamic_calls, prefer_null_aware_method_calls
          ontap!();
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: hm, vertical: vm),
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: borderColor,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: textColor,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

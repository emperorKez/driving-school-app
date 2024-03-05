import 'package:flutter/material.dart';
import 'package:korbil_mobile/global/constants/colors.dart';

class PrimaryBtn extends StatelessWidget {
  const PrimaryBtn({
    required this.text,
    this.ontap,
    this.vm = 15,
    this.hm = 30,
    this.fontSize = 20,
    this.pvm = 15,
    this.phm = 0,
    this.bgColor = AppColors.green,
    super.key,
  });
  final String text;
  final Function? ontap;
  final double vm, hm;
  final double pvm;
  final double phm;
  final double fontSize;
  final Color bgColor;

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
        padding: EdgeInsets.symmetric(
          vertical: pvm,
          horizontal: phm,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: AppColors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/components/secondary_btn.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/pages/lessons/views/completed_lesson_details/views/inst_completed_lesson_details.dart';

class AlertContent extends StatelessWidget {
  const AlertContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Image.asset(
              'assets/imgs/ins/lessons/green_tick.png',
              width: 60,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Confirm?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: AppColors.black,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'You are about to confirm And finish lesson',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: AppColors.black,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          PrimaryBtn(
            text: 'Confirm',
            ontap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (cxt) => const InstCompletedLessonDetails(),
                ),
              );
            },
            vm: 10,
            hm: 0,
          ),
          SecondaryBtn(
            text: 'Discard',
            ontap: () {
              Navigator.pop(context);
            },
            vm: 5,
            hm: 0,
          ),
        ],
      ),
    );
  }
}

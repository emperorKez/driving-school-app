import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/lessons/lesson_step_card.dart';
import 'package:korbil_mobile/global/constants/colors.dart';

class SingleLessonStepCard extends StatelessWidget {
  const SingleLessonStepCard({
    required this.step, super.key,
  });

  final StepDetails step;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute<dynamic>(
        //     builder: (cxt) => const InstLessonDetails(calender: null,),
        //   ),
        // );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: AppColors.grey2,
              blurRadius: 3,
              spreadRadius: 3,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              step.title,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColors.green,
              ),
            ),
            if (step.location.isNotEmpty)
              Row(
                children: [
                  Image.asset(
                    'assets/imgs/ins/lessons/marker.png',
                    width: 15,
                  ),
                  Text(
                    step.location,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: AppColors.black,
                    ),
                  ),
                ],
              )
            else
              Container(),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  step.time,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  step.duration,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: AppColors.black,
                  ),
                ),
                const Spacer(),
                Text(
                  step.name,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

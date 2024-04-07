import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/pages/lessons/views/finish_lesson_screen/views/inst_finish_lesson_screen.dart';
import 'package:korbil_mobile/theme/theme.dart';

class BottomSheetDetails extends StatelessWidget {
  const BottomSheetDetails({
    required this.s,
    required this.lessonId, super.key,
  });

  final Size s;
  final int lessonId;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 20,
        left: 15,
        right: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: AppColors.grey2,
        //     blurRadius: 1,
        //     spreadRadius: 1,
        //     offset: Offset(-2, -4),
        //   )
        // ],
        color: KorbilTheme.of(context).white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Container(
          //   width: s.width * 0.35,
          //   height: 6,
          //   decoration: BoxDecoration(
          //     color: AppColors.grey1,
          //     borderRadius: BorderRadius.circular(13),
          //   ),
          // ),
          const SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/imgs/ins/lessons/road_green.png',
                      width: 24,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Driven 12 KM',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: KorbilTheme.of(context).secondaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/imgs/ins/lessons/clock_green.png',
                      width: 24,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '30 mins',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: KorbilTheme.of(context).secondaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          PrimaryBtn(
            text: 'Finish Lesson',
            pvm: 12,
            fontSize: 14,
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (cxt) =>  InstFinishLessonView(lessonId: lessonId,),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/pages/lessons/bloc/lesson/lesson_bloc.dart';
import 'package:korbil_mobile/pages/lessons/views/completed_lesson_details/views/inst_completed_lesson_details.dart';
import 'package:korbil_mobile/pages/lessons/views/inst_finish_lesson_with_map_screen/views/alert_content.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class InstFinishLessonWithMapView extends StatefulWidget {
  const InstFinishLessonWithMapView({required this.lessonId, super.key});
  final int lessonId;

  @override
  State<InstFinishLessonWithMapView> createState() =>
      _InstFinishLessonWithMapViewState();
}

class _InstFinishLessonWithMapViewState
    extends State<InstFinishLessonWithMapView> {
  Future<bool?> _showConfirmFinishLessonAlert() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          // title: Text('Dialog Title'),
          content: AlertContent(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox(
        child: Stack(
          children: [
            SizedBox(
              width: s.width,
              height: s.height,
              child: Image.asset(
                'assets/imgs/ins/lessons/sample_map.png',
                width: s.width,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: getPreferedOrientation(context) ==
                      PreferedOrientation.landscape
                  ? s.width * 0.5
                  : s.width,
              height: s.height,
              child: Column(
                children: [
                  if (getPreferedOrientation(context) ==
                      PreferedOrientation.landscape)
                    Container()
                  else
                    const Spacer(),
                  bottomSheetDetails(
                     s,
                    // onFinishLessonTap: _showConfirmFinishLessonAlert,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomSheetDetails(Size s) {
    return Container(
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 20,
        left: 15,
        right: 15,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey2,
            blurRadius: 3,
            spreadRadius: 3,
            offset: Offset(-2, -4),
          ),
        ],
        color: AppColors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (getPreferedOrientation(context) == PreferedOrientation.landscape)
            Container()
          else
            Container(
              width: s.width * 0.35,
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.grey1,
                borderRadius: BorderRadius.circular(13),
              ),
            ),
          const SizedBox(height: 35),
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
                    const SizedBox(width: 10),
                    const Text(
                      'Driven 15 KM',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.black,
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
                    const SizedBox(width: 10),
                    const Text(
                      'Time 40 min',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          // PrimaryBtn(
          //   text: 'Add Common Review',
          //   pvm: 12,
          //   vm: 5,
          //   fontSize: 14,
          //   ontap: () {
          //     // Navigator.push(
          //     //   context,
          //     //   MaterialPageRoute<dynamic>(
          //     //     builder: (cxt) => const InstLessonDetailAddReviewView(),
          //     //   ),
          //     // );
          //   },
          // ),
          PrimaryBtn(
            text: 'Finish Lesson',
            pvm: 12,
            fontSize: 14,
            ontap: () async {
            bool? confirmation = await  _showConfirmFinishLessonAlert();
            // bool confirmation =  onFinishLessonTap;
            if (confirmation != null && confirmation == true){
print(getPayload());
if(!context.mounted) return;
// context.read<LessonBloc>().add(FinishLesson(lessonId: widget.lessonId, payload: getPayload()));
await Navigator.pushReplacement(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (cxt) => InstCompletedLessonDetails(lessonId: widget.lessonId,), 
                ),
              );
            }
            },
          ),
        ],
      ),
    );
  }
  Map<String, dynamic> getPayload(){
    return {
  'postLessonNote': 'string',
  'distance': 0,
  'additionalFeedback': [
    {
      'skillCategoryId': 0,
      'subSkillCategoryId': 0,
      'category': {
        'id': 0,
        'name': 'string',
        'code': 'string',
        'icon': 'string',
        'description': 'string',
        'subCategories': [
          {
            'id': 0,
            'name': 'string',
            'code': 'string',
            'description': 'string'
          }
        ]
      },
      'subCategory': {
        'id': 0,
        'name': 'string',
        'code': 'string',
        'description': 'string'
      },
      'longitude': 0,
      'latitude': 0,
      'grade': 0,
      'comment': 'string'
    }
  ]
};
  }
}

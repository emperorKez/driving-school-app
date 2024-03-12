import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/pages/lessons/views/lesson_detail_add_review/views/inst_lesson_details_add_review.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class InstLessonDetailMapView extends StatefulWidget {
  const InstLessonDetailMapView({super.key});

  @override
  State<InstLessonDetailMapView> createState() =>
      _InstLessonDetailMapViewState();
}

class _InstLessonDetailMapViewState extends State<InstLessonDetailMapView> {
  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return SafeArea(
      child: getPreferedOrientation(context) == PreferedOrientation.landscape
          ? _renderTabBody(s)
          : _renderMobileBody(s),
    );
  }

  Scaffold _renderTabBody(Size s) {
    return Scaffold(
      backgroundColor: KorbilTheme.of(context).primaryBg,
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
              width: s.width * 0.5,
              height: 400,
              child: Column(
                children: [
                  _BottomSheetDetails(s: s),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Scaffold _renderMobileBody(Size s) {
    return Scaffold(
      backgroundColor: KorbilTheme.of(context).primaryBg,
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
              width: s.width,
              height: s.height,
              child: Column(
                children: [
                  const Spacer(),
                  _BottomSheetDetails(s: s),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomSheetDetails extends StatelessWidget {
  const _BottomSheetDetails({
    required this.s,
  });

  final Size s;

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
        boxShadow: [
          BoxShadow(
            color: KorbilTheme.of(context).alternate2,
            blurRadius: 3,
            spreadRadius: 3,
            offset: const Offset(-2, -4),
          ),
        ],
        color: KorbilTheme.of(context).primaryBg,
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
                color: KorbilTheme.of(context).alternate1,
                borderRadius: BorderRadius.circular(13),
              ),
            ),
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
                      'Driven 15 KM',
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
                      'Time 40 min',
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
                  builder: (cxt) => const InstLessonDetailAddReviewView(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

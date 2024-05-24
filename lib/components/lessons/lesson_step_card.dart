import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/single_lesson_step_card.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/repository/lesson/model/calender.dart';

class LessonStepCard extends StatelessWidget {
  const LessonStepCard({
    required this.reached,
    required this.isNextCompleted,
    required this.step,
    required this.calender,
    super.key,
    this.isLast = false,
    this.isFirst = false,
  });

  final bool reached;
  final bool isNextCompleted;
  final StepDetails step;
  final bool isLast;
  final bool isFirst;
  final Calender calender;

  Widget _renderTrailingLine() {
    if (isLast) {
      return Expanded(flex: 2, child: Container());
    } else if (!isNextCompleted) {
      return Expanded(
        flex: 2,
        child: CustomPaint(
          size: const Size(2, double.infinity),
          painter: DottedVerticalLinePainter(),
        ),
      );
    } else if (reached) {
      return const Expanded(
        flex: 2,
        child: VerticalDivider(
          color: AppColors.green,
          thickness: 2,
          width: 2,
          endIndent: 0,
          indent: 0,
        ),
      );
    } else {
      return Expanded(
        flex: 2,
        child: CustomPaint(
          size: const Size(2, double.infinity),
          painter: DottedVerticalLinePainter(),
        ),
      );
    }
  }

  Widget _renderPreLine() {
    if (isFirst) {
      return Expanded(child: Container());
    } else if (reached) {
      return const Expanded(
        child: VerticalDivider(
          color: AppColors.green,
          thickness: 2,
          width: 2,
          endIndent: 0,
          indent: 0,
        ),
      );
    } else {
      return Expanded(
        child: CustomPaint(
          size: const Size(2, double.infinity),
          painter: DottedVerticalLinePainter(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                _renderPreLine(),
                IntrinsicHeight(
                  child: reached
                      ? Image.asset(
                          'assets/imgs/ins/lessons/oval_green.png',
                          width: 16,
                          height: 16,
                        )
                      : Image.asset(
                          'assets/imgs/ins/lessons/Oval.png',
                          width: 16,
                          height: 16,
                        ),
                ),
                _renderTrailingLine(),
              ],
            ),
          ),
          Expanded(child: SingleLessonStepCard(step: step, calender: calender,)),
        ],
      ),
    );
  }
}

class StepDetails {
  StepDetails({
    required this.title,
    required this.time,
    required this.duration,
    required this.name,
    // ignore: unused_element
    this.location = '',
    this.isCompleted = false,
  });

  final String title;
  final String time;
  final String duration;
  final String name;
  final String location;
  bool isCompleted;
}

class DottedVerticalLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const dashHeight = 10;
    const dashSpace = 5;
    var startY = 0.0;
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 0.5;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

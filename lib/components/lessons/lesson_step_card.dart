import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/single_lesson_step_card.dart';
import 'package:korbil_mobile/global/constants/colors.dart';

class LessonStepCard extends StatelessWidget {
  const LessonStepCard({
    super.key,
    required this.reached,
    required this.isNextCompleted,
    required this.step,
    this.isLast = false,
    this.isFirst = false,
  });

  final bool reached;
  final bool isNextCompleted;
  final StepDetails step;
  final bool isLast;
  final bool isFirst;

  Widget _renderTrailingLine() {
    if (isLast) {
      return Expanded(flex: 2, child: Container());
    } else if (!isNextCompleted) {
      return Expanded(
        flex: 2,
        child: CustomPaint(
            size: const Size(2, double.infinity),
            painter: DottedVerticalLinePainter()),
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
          Expanded(child: SingleLessonStepCard(step: step)),
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

  final String title, time, duration, name;
  final String location;
  bool isCompleted;
}

class DottedVerticalLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 10, dashSpace = 5, startY = 0;
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

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:korbil_mobile/global/constants/colors.dart';

class ScheduleStatusType3Widget extends StatelessWidget {
  const ScheduleStatusType3Widget({
    required this.cts,
    this.cellDetails,
    super.key,
  });
  final BoxConstraints cts;
  final DateRangePickerCellDetails? cellDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cts.maxWidth,
      height: cts.maxHeight,
      padding: const EdgeInsets.only(
        left: 2,
        top: 2,
        right: 2,
      ),
      margin: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.green,
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              cellDetails != null ? cellDetails!.date.day.toString() : '',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColors.white,
              ),
            ),
            Container(
              width: 6,
              height: 6,
              // margin: const EdgeInsets.only(top: 3),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

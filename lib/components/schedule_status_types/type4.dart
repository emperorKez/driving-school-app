import 'package:flutter/material.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ScheduleStatusType4Widget extends StatelessWidget {
  const ScheduleStatusType4Widget({
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
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.grey1,
      ),
      child: Center(
        child: Text(
          cellDetails != null ? cellDetails!.date.day.toString() : '',
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:korbil_mobile/components/schedule_status_types/type1.dart';
import 'package:korbil_mobile/components/schedule_status_types/type2.dart';
import 'package:korbil_mobile/components/schedule_status_types/type3.dart';
import 'package:korbil_mobile/components/schedule_status_types/type4.dart';
import 'package:korbil_mobile/global/constants/colors.dart';

class InstWeeklyCalendar extends StatefulWidget {
  const InstWeeklyCalendar({super.key});

  @override
  State<InstWeeklyCalendar> createState() => _InstWeeklyCalendarState();
}

class _InstWeeklyCalendarState extends State<InstWeeklyCalendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 150,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: AppColors.grey2,
              blurRadius: 3,
              spreadRadius: 3,
              offset: Offset(2, 2),
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'June 2022',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: AppColors.black,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 15,
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Transform.rotate(
                    angle: pi,
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 15,
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Divider(
                color: AppColors.grey1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _DayWidget(
                  date: 'S',
                  dateWidget: ScheduleStatusType2Widget(
                    cellDetails: DateRangePickerCellDetails(
                      date: DateTime.now(),
                      bounds: Rect.zero,
                      visibleDates: [],
                    ),
                    cts: _dateBoxConstraints(),
                  ),
                ),
                _DayWidget(
                  date: 'M',
                  dateWidget: ScheduleStatusType2Widget(
                    cellDetails: DateRangePickerCellDetails(
                      date: DateTime.now(),
                      bounds: Rect.zero,
                      visibleDates: [],
                    ),
                    cts: _dateBoxConstraints(),
                  ),
                ),
                _DayWidget(
                  date: 'T',
                  dateWidget: ScheduleStatusType2Widget(
                    cellDetails: DateRangePickerCellDetails(
                      date: DateTime.now(),
                      bounds: Rect.zero,
                      visibleDates: [],
                    ),
                    cts: _dateBoxConstraints(),
                  ),
                ),
                _DayWidget(
                  date: 'W',
                  dateWidget: ScheduleStatusType4Widget(
                    cellDetails: DateRangePickerCellDetails(
                      date: DateTime.now(),
                      bounds: Rect.zero,
                      visibleDates: [],
                    ),
                    cts: _dateBoxConstraints(),
                  ),
                ),
                _DayWidget(
                  date: 'T',
                  dateWidget: ScheduleStatusType3Widget(
                    cellDetails: DateRangePickerCellDetails(
                      date: DateTime.now(),
                      bounds: Rect.zero,
                      visibleDates: [],
                    ),
                    cts: _dateBoxConstraints(),
                  ),
                ),
                _DayWidget(
                  date: 'F',
                  dateWidget: ScheduleStatusType2Widget(
                    cellDetails: DateRangePickerCellDetails(
                      date: DateTime.now(),
                      bounds: Rect.zero,
                      visibleDates: [],
                    ),
                    cts: _dateBoxConstraints(),
                  ),
                ),
                _DayWidget(
                  date: 'S',
                  dateWidget: ScheduleStatusType1Widget(
                    cellDetails: DateRangePickerCellDetails(
                      date: DateTime.now(),
                      bounds: Rect.zero,
                      visibleDates: [],
                    ),
                    cts: _dateBoxConstraints(),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  BoxConstraints _dateBoxConstraints() =>
      const BoxConstraints(maxWidth: 30, maxHeight: 30);
}

class _DayWidget extends StatelessWidget {
  const _DayWidget({
    required this.date,
    required this.dateWidget,
    super.key,
  });

  final String date;
  final Widget dateWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          date,
          style: const TextStyle(
            fontFamily: 'Lato',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.black,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        dateWidget
      ],
    );
  }
}

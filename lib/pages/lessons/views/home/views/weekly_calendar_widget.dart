import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/pages/lessons/bloc/calender/calender_cubit.dart';

class InstWeeklyCalendar extends StatefulWidget {
  const InstWeeklyCalendar({
    this.category = 'all',
    super.key,
  });
  final String category;

  @override
  State<InstWeeklyCalendar> createState() => _InstWeeklyCalendarState();
}

class _InstWeeklyCalendarState extends State<InstWeeklyCalendar> {
  DateTime calenderDate = DateTime.now();
  final dateFormat = DateFormat('yyyy-MM-dd');

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
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                DateFormat.yMMMM().format(calenderDate),
                style: const TextStyle(
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
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: const Divider(
              color: AppColors.grey1,
            ),
          ),
          WeeklyCal(date: DateTime.now()),
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       _DayWidget(
          //         date: 'S',
          //         dateWidget: ScheduleStatusType2Widget(
          //           cellDetails: DateRangePickerCellDetails(
          //             date: DateTime.now(),
          //             bounds: Rect.zero,
          //             visibleDates: [],
          //           ),
          //           cts: _dateBoxConstraints(),
          //         ),
          //       ),
          //       _DayWidget(
          //         date: 'M',
          //         dateWidget: ScheduleStatusType2Widget(
          //           cellDetails: DateRangePickerCellDetails(
          //             date: DateTime.now(),
          //             bounds: Rect.zero,
          //             visibleDates: [],
          //           ),
          //           cts: _dateBoxConstraints(),
          //         ),
          //       ),
          //       _DayWidget(
          //         date: 'T',
          //         dateWidget: ScheduleStatusType2Widget(
          //           cellDetails: DateRangePickerCellDetails(
          //             date: DateTime.now(),
          //             bounds: Rect.zero,
          //             visibleDates: [],
          //           ),
          //           cts: _dateBoxConstraints(),
          //         ),
          //       ),
          //       _DayWidget(
          //         date: 'W',
          //         dateWidget: ScheduleStatusType4Widget(
          //           cellDetails: DateRangePickerCellDetails(
          //             date: DateTime.now(),
          //             bounds: Rect.zero,
          //             visibleDates: [],
          //           ),
          //           cts: _dateBoxConstraints(),
          //         ),
          //       ),
          //       _DayWidget(
          //         date: 'T',
          //         dateWidget: ScheduleStatusType3Widget(
          //           cellDetails: DateRangePickerCellDetails(
          //             date: DateTime.now(),
          //             bounds: Rect.zero,
          //             visibleDates: [],
          //           ),
          //           cts: _dateBoxConstraints(),
          //         ),
          //       ),
          //       _DayWidget(
          //         date: 'F',
          //         dateWidget: ScheduleStatusType2Widget(
          //           cellDetails: DateRangePickerCellDetails(
          //             date: DateTime.now(),
          //             bounds: Rect.zero,
          //             visibleDates: [],
          //           ),
          //           cts: _dateBoxConstraints(),
          //         ),
          //       ),
          //       _DayWidget(
          //         date: 'S',
          //         dateWidget: ScheduleStatusType1Widget(
          //           cellDetails: DateRangePickerCellDetails(
          //             date: DateTime.now(),
          //             bounds: Rect.zero,
          //             visibleDates: [],
          //           ),
          //           cts: _dateBoxConstraints(),
          //         ),
          //       ),
          //     ],
          //   ),
        ],
      ),
    );
  }

  BoxConstraints _dateBoxConstraints() =>
      const BoxConstraints(maxWidth: 30, maxHeight: 30);
}

class _DayWidget extends StatelessWidget {
  const _DayWidget({
    required this.date,
    required this.dateWidget,
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
        dateWidget,
      ],
    );
  }
}

class WeeklyCal extends StatelessWidget {
  const WeeklyCal({required this.date, super.key});
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final labels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    final days = getDates();
    return BlocBuilder<CalenderCubit, CalenderState>(
      builder: (context, state) {
        if (state is! CalenderLoaded) {
          return kLoadingWidget(context);
        } else {
          
return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
            List.generate(7, (index) => weekDay(state: state, label:labels[index],day: days[index])),
      );}},);
  }

  Widget weekDay({required CalenderLoaded state, required String label, required int day}) {
    final dateFormat = DateFormat('yyyy-MM-dd');
    final currentDate = dateFormat.parse('${date.year}-${date.month}-$day');
    var isScheduled = false;        
          for (final item in state.calender) {
            if (dateFormat.parse(item.scheduledDate) == currentDate) {
              isScheduled = true;
            }
          }

          return Column(
            children: [
              Text(
                label,
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
              GestureDetector(
                child: Container(
                  width: 30,
                  height: 30,
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: AppColors.green,
                      border: Border.all(color: AppColors.green),
                      color: isScheduled
                          ? AppColors.green
                          : currentDate.day == DateTime.now().day
                              ? AppColors.grey1
                              : Colors.white,),
                  child: Center(
                    child: Text(
                      '$day',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: currentDate.day == DateTime.now().day
                            ? Colors.white
                            : isScheduled
                                ? Colors.white
                                : AppColors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }

  List<int> getDates() {
    var days = <int>[];
    final day = DateTime.now().day;
    switch (DateTime.now().weekday) {
      case 1:
        days = [day, day + 1, day + 2, day + 3, day + 4, day + 5, day + 6];
      case 2:
        days = [day - 1, day, day + 1, day + 2, day + 3, day + 4, day + 5];
      case 3:
        days = [day - 2, day - 1, day, day + 1, day + 2, day + 3, day + 4];
      case 4:
        days = [day - 3, day - 2, day - 1, day, day + 1, day + 2, day + 3];
      case 5:
        days = [day - 4, day - 3, day - 2, day - 1, day, day + 1, day + 2];
      case 6:
        days = [day - 5, day - 4, day - 3, day - 2, day - 1, day, day + 1];
      case 7:
        days = [day - 6, day - 5, day - 4, day - 3, day - 2, day - 1, day];

      default:
        days = [];
    }
    return days;
  }
}

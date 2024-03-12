import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/custom_screen_padding.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/components/schedule_status_types/default.dart';
import 'package:korbil_mobile/components/schedule_status_types/type1.dart';
import 'package:korbil_mobile/components/schedule_status_types/type2.dart';
import 'package:korbil_mobile/components/schedule_status_types/type3.dart';
import 'package:korbil_mobile/components/schedule_status_types/type4.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/global/constants/schedule_status_types.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddExceptionView extends StatefulWidget {
  const AddExceptionView({super.key});

  @override
  State<AddExceptionView> createState() => _AddExceptionViewState();
}

class _AddExceptionViewState extends State<AddExceptionView> {
  final List<_DateDetails> _schedule = [
    _DateDetails(
      DateTime(2023, 08, 2),
      ScheduleStatusTypes.almostbookedWithGroupClass,
    ),
    _DateDetails(
      DateTime(2023, 08, 3),
      ScheduleStatusTypes.fullyBooked,
    ),
    _DateDetails(
      DateTime(2023, 08, 8),
      ScheduleStatusTypes.fullyBooked,
    ),
    _DateDetails(
      DateTime(2023, 08, 9),
      ScheduleStatusTypes.oneOrTwoLeft,
    ),
    _DateDetails(
      DateTime(2023, 08, 10),
      ScheduleStatusTypes.onetofiveBooked,
    ),
    _DateDetails(
      DateTime(2023, 08, 20),
      ScheduleStatusTypes.onetofiveBooked,
    ),
    _DateDetails(
      DateTime(2023, 08, 21),
      ScheduleStatusTypes.fullyBooked,
    ),
    _DateDetails(
      DateTime(2023, 08, 24),
      ScheduleStatusTypes.onetofiveBooked,
    ),
    _DateDetails(
      DateTime(2023, 08, 25),
      ScheduleStatusTypes.onetofiveBooked,
    ),
    _DateDetails(
      DateTime(2023, 08, 26),
      ScheduleStatusTypes.fullyBooked,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final th = KorbilTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Edit Time Schedule',
          style: TextStyle(
            fontFamily: 'Lato',
            color: th.secondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: const InstAppBarBackBtn(),
      ),
      body: CustomScreenPadding(
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            _MainCalendarWidget(context: context, schedule: _schedule),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Change available hours',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: th.secondaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const _ExceptionTimeSlotCard(),
            const SizedBox(
              height: 40,
            ),
            const PrimaryBtn(
              text: 'Save',
              fontSize: 14,
              hm: 0,
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class _MainCalendarWidget extends StatelessWidget {
  const _MainCalendarWidget({
    required this.context,
    required this.schedule,
  });

  final BuildContext context;
  final List<_DateDetails> schedule;

  @override
  Widget build(BuildContext context) {
    final th = KorbilTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: th.alternate2,
            blurRadius: 3,
            spreadRadius: 3,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: SfDateRangePicker(
        backgroundColor: th.white,
        selectionColor: Colors.transparent,
        showNavigationArrow: true,
        cellBuilder: (context, cellDetails) {
          return LayoutBuilder(
            builder: (cxt, cts) {
              final date = DateTime(
                cellDetails.date.year,
                cellDetails.date.month,
                cellDetails.date.day,
              );

              for (var i = 0; i < schedule.length; i++) {
                final s = schedule[i];
                if (s.date.compareTo(date) == 0) {
                  switch (s.type) {
                    case ScheduleStatusTypes.onetofiveBooked:
                      return ScheduleStatusType1Widget(
                        cellDetails: cellDetails,
                        cts: cts,
                      );
                    case ScheduleStatusTypes.oneOrTwoLeft:
                      return ScheduleStatusType2Widget(
                        cellDetails: cellDetails,
                        cts: cts,
                      );
                    case ScheduleStatusTypes.almostbookedWithGroupClass:
                      return ScheduleStatusType3Widget(
                        cellDetails: cellDetails,
                        cts: cts,
                      );
                    case ScheduleStatusTypes.fullyBooked:
                      return ScheduleStatusType4Widget(
                        cellDetails: cellDetails,
                        cts: cts,
                      );
                    default:
                      return ScheduleStatusTypeDefaultWidget(
                        cellDetails: cellDetails,
                        cts: cts,
                      );
                  }
                }
              }

              return ScheduleStatusTypeDefaultWidget(
                cellDetails: cellDetails,
                cts: cts,
              );
            },
          );
        },
      ),
    );
  }
}

class _ExceptionTimeSlotCard extends StatefulWidget {
  const _ExceptionTimeSlotCard();

  @override
  State<_ExceptionTimeSlotCard> createState() => _AvailableTimeSlotCardState();
}

class _AvailableTimeSlotCardState extends State<_ExceptionTimeSlotCard> {
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    final th = KorbilTheme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 70,
            child: TextFormField(
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: th.secondaryColor,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: th.alternate2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: th.primaryColor,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: th.warningColor,
                  ),
                ),
                hintText: 'HH:MM',
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: th.alternate1,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              '-',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: th.secondaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            width: 70,
            child: TextFormField(
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: th.secondaryColor,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: th.alternate2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: th.primaryColor,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: th.warningColor,
                  ),
                ),
                hintText: 'HH:MM',
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: th.alternate1,
                ),
              ),
            ),
          ),
          const Spacer(),
          Image.asset(
            'assets/imgs/ins/lessons/bin.png',
            width: 24,
          ),
          Container(
            margin: const EdgeInsets.only(left: 15),
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.green,
            ),
            child: const Center(
              child: Icon(
                Icons.add,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DateDetails {
  _DateDetails(
    this.date,
    this.type,
  );

  final DateTime date;
  final String type;
}

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/custom_screen_padding.dart';
import 'package:korbil_mobile/components/schedule_status_types/default.dart';
import 'package:korbil_mobile/components/schedule_status_types/type1.dart';
import 'package:korbil_mobile/components/schedule_status_types/type2.dart';
import 'package:korbil_mobile/components/schedule_status_types/type3.dart';
import 'package:korbil_mobile/components/schedule_status_types/type4.dart';
import 'package:korbil_mobile/global/constants/schedule_status_types.dart';
import 'package:korbil_mobile/pages/lessons/views/add_exception/views/add_exception.dart';
import 'package:korbil_mobile/theme/theme.dart';

class EditTimeSchedule extends StatefulWidget {
  const EditTimeSchedule({super.key});

  @override
  State<EditTimeSchedule> createState() => _EditTimeScheduleState();
}

class _EditTimeScheduleState extends State<EditTimeSchedule> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Edit Time Schedule',
          style: TextStyle(
            fontFamily: 'Lato',
            color: KorbilTheme.of(context).secondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: const InstAppBarBackBtn(),
      ),
      body: CustomScreenPadding(
        child: ListView(
          children: [
            Row(
              children: [
                const Spacer(),
                Image.asset(
                  'assets/imgs/ins/lessons/recycle_green.png',
                  width: 20,
                ),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (_) => const AddExceptionView(),
                      ),
                    );
                  },
                  child: Text(
                    'ADD EXCEPTIONS',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            _Calendar(context: context, schedule: _schedule),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Set your weekly available hours?',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: KorbilTheme.of(context).secondaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const _AvailableTimeSlotCard(
              day: 'SUN',
            ),
            const _AvailableTimeSlotCard(
              day: 'MON',
            ),
            const _AvailableTimeSlotCard(
              day: 'TUE',
            ),
            const _AvailableTimeSlotCard(
              day: 'WED',
            ),
            const _AvailableTimeSlotCard(
              day: 'THU',
            ),
            const _AvailableTimeSlotCard(
              day: 'FRI',
            ),
            const _AvailableTimeSlotCard(
              day: 'SAT',
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

class _Calendar extends StatelessWidget {
  const _Calendar({
    super.key,
    required this.context,
    required this.schedule,
  });

  final BuildContext context;
  final List<_DateDetails> schedule;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: KorbilTheme.of(context).alternate2,
            blurRadius: 3,
            spreadRadius: 3,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: SfDateRangePicker(
        backgroundColor: KorbilTheme.of(context).white,
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

class _AvailableTimeSlotCard extends StatefulWidget {
  const _AvailableTimeSlotCard({
    required this.day,
    super.key,
  });
  final String day;

  @override
  State<_AvailableTimeSlotCard> createState() => _AvailableTimeSlotCardState();
}

class _AvailableTimeSlotCardState extends State<_AvailableTimeSlotCard> {
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Checkbox(
            value: selected,
            onChanged: (val) {
              setState(() {
                selected = !selected;
              });
            },
            activeColor: KorbilTheme.of(context).primaryColor,
          ),
          SizedBox(
            width: 35,
            child: Text(
              widget.day,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: KorbilTheme.of(context).secondaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 70,
            child: TextFormField(
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: KorbilTheme.of(context).secondaryColor,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: KorbilTheme.of(context).alternate2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: KorbilTheme.of(context).primaryColor,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: KorbilTheme.of(context).warningColor,
                  ),
                ),
                hintText: 'HH:MM',
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: KorbilTheme.of(context).alternate1,
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
                color: KorbilTheme.of(context).secondaryColor,
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
                color: KorbilTheme.of(context).secondaryColor,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: KorbilTheme.of(context).alternate2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: KorbilTheme.of(context).primaryColor,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: KorbilTheme.of(context).warningColor,
                  ),
                ),
                hintText: 'HH:MM',
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: KorbilTheme.of(context).alternate1,
                ),
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

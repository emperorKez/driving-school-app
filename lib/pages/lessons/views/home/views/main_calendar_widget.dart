import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/schedule_status_types/default.dart';
import 'package:korbil_mobile/components/schedule_status_types/type1.dart';
import 'package:korbil_mobile/components/schedule_status_types/type2.dart';
import 'package:korbil_mobile/components/schedule_status_types/type3.dart';
import 'package:korbil_mobile/components/schedule_status_types/type4.dart';
import 'package:korbil_mobile/global/constants/schedule_status_types.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MainCalendarWidget extends StatefulWidget {
  const MainCalendarWidget({
    super.key,
  });

  @override
  State<MainCalendarWidget> createState() => _MainCalendarWidgetState();
}

class _MainCalendarWidgetState extends State<MainCalendarWidget> {
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

              for (var i = 0; i < _schedule.length; i++) {
                final s = _schedule[i];
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

class _DateDetails {
  _DateDetails(
    this.date,
    this.type,
  );

  final DateTime date;
  final String type;
}

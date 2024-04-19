// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/custom_screen_padding.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/components/schedule_status_types/default.dart';
import 'package:korbil_mobile/components/schedule_status_types/type1.dart';
import 'package:korbil_mobile/components/schedule_status_types/type2.dart';
import 'package:korbil_mobile/components/schedule_status_types/type3.dart';
import 'package:korbil_mobile/components/schedule_status_types/type4.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/global/constants/schedule_status_types.dart';
import 'package:korbil_mobile/pages/lessons/views/add_exception/views/add_exception.dart';
import 'package:korbil_mobile/pages/school/bloc/availability/availabilty_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class EditTimeSchedule extends StatefulWidget {
  const EditTimeSchedule({super.key});

  @override
  State<EditTimeSchedule> createState() => _EditTimeScheduleState();
}

class _EditTimeScheduleState extends State<EditTimeSchedule> {
  final _formKey = GlobalKey<FormState>();
  final startTimeController0 = TextEditingController();
  final startTimeController1 = TextEditingController();
  final startTimeController2 = TextEditingController();
  final startTimeController3 = TextEditingController();
  final startTimeController4 = TextEditingController();
  final startTimeController5 = TextEditingController();
  final startTimeController6 = TextEditingController();
  final endTimeController0 = TextEditingController();
  final endTimeController1 = TextEditingController();
  final endTimeController2 = TextEditingController();
  final endTimeController3 = TextEditingController();
  final endTimeController4 = TextEditingController();
  final endTimeController5 = TextEditingController();
  final endTimeController6 = TextEditingController();

  final selectedWeekdays = <int>[];

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
      body: BlocConsumer<AvailabiltyBloc, AvailabiltyState>(
        listener: (context, state) {
          if (state is AvailabiltyError) {
            errorSnackbar(context, error: state.error);
          }
        },
        builder: (context, state) {
          if (state is AvailabiltyInitial) {
            context.read<AvailabiltyBloc>().add(GetAvailableDates(
                context.read<SchoolBloc>().state.schoolInfo!.id));
          }
          if (state is! AvailabiltyLoaded) {
            return kLoadingWidget(context);
          } else {
            if (state.availableDates!.indexWhere((e) => e.weekday == 0) >= 0) {
              final sun = state
                  .availableDates![
                      state.availableDates!.indexWhere((e) => e.weekday == 0)]
                  .availableHours[0];
              startTimeController0.text =
                  '${sun.startTime.hour}:${sun.startTime.minute}';
              endTimeController0.text =
                  '${sun.endTime.hour}:${sun.endTime.minute}';
              selectedWeekdays.add(0);
            }

            if (state.availableDates!.indexWhere((e) => e.weekday == 1) >= 0) {
              final mon = state
                  .availableDates![
                      state.availableDates!.indexWhere((e) => e.weekday == 0)]
                  .availableHours[0];
              startTimeController1.text =
                  '${mon.startTime.hour}:${mon.startTime.minute}';
              endTimeController1.text =
                  '${mon.endTime.hour}:${mon.endTime.minute}';
              selectedWeekdays.add(1);
            }
            if (state.availableDates!.indexWhere((e) => e.weekday == 2) >= 0) {
              final tue = state
                  .availableDates![
                      state.availableDates!.indexWhere((e) => e.weekday == 0)]
                  .availableHours[0];
              startTimeController2.text =
                  '${tue.startTime.hour}:${tue.startTime.minute}';
              endTimeController2.text =
                  '${tue.endTime.hour}:${tue.endTime.minute}';
              selectedWeekdays.add(2);
            }
            if (state.availableDates!.indexWhere((e) => e.weekday == 3) >= 0) {
              final wed = state
                  .availableDates![
                      state.availableDates!.indexWhere((e) => e.weekday == 0)]
                  .availableHours[0];
              startTimeController3.text =
                  '${wed.startTime.hour}:${wed.startTime.minute}';
              endTimeController3.text =
                  '${wed.endTime.hour}:${wed.endTime.minute}';
              selectedWeekdays.add(3);
            }
            if (state.availableDates!.indexWhere((e) => e.weekday == 4) >= 0) {
              final thu = state
                  .availableDates![
                      state.availableDates!.indexWhere((e) => e.weekday == 0)]
                  .availableHours[0];
              startTimeController4.text =
                  '${thu.startTime.hour}:${thu.startTime.minute}';
              endTimeController4.text =
                  '${thu.endTime.hour}:${thu.endTime.minute}';
              selectedWeekdays.add(4);
            }
            if (state.availableDates!.indexWhere((e) => e.weekday == 5) >= 0) {
              final fri = state
                  .availableDates![
                      state.availableDates!.indexWhere((e) => e.weekday == 0)]
                  .availableHours[0];
              startTimeController5.text =
                  '${fri.startTime.hour}:${fri.startTime.minute}';
              endTimeController5.text =
                  '${fri.endTime.hour}:${fri.endTime.minute}';
              selectedWeekdays.add(5);
            }
            if (state.availableDates!.indexWhere((e) => e.weekday == 6) >= 0) {
              final sat = state
                  .availableDates![
                      state.availableDates!.indexWhere((e) => e.weekday == 0)]
                  .availableHours[0];
              startTimeController6.text =
                  '${sat.startTime.hour}:${sat.startTime.minute}';
              endTimeController6.text =
                  '${sat.endTime.hour}:${sat.endTime.minute}';
              selectedWeekdays.add(6);
            }

            return CustomScreenPadding(
              child: ListView(
                shrinkWrap: true,
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
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _availableTimeSlotCard(
                          day: 'SUN',
                          weekday: 0,
                          controller: [
                            startTimeController0,
                            endTimeController0,
                          ],
                        ),
                        _availableTimeSlotCard(
                          day: 'MON',
                          weekday: 1,
                          controller: [
                            startTimeController1,
                            endTimeController1,
                          ],
                        ),
                        _availableTimeSlotCard(
                          day: 'TUE',
                          weekday: 2,
                          controller: [
                            startTimeController2,
                            endTimeController2,
                          ],
                        ),
                        _availableTimeSlotCard(
                          day: 'WED',
                          weekday: 3,
                          controller: [
                            startTimeController3,
                            endTimeController3,
                          ],
                        ),
                        _availableTimeSlotCard(
                          day: 'THU',
                          weekday: 4,
                          controller: [
                            startTimeController4,
                            endTimeController4,
                          ],
                        ),
                        _availableTimeSlotCard(
                          day: 'FRI',
                          weekday: 5,
                          controller: [
                            startTimeController5,
                            endTimeController5,
                          ],
                        ),
                        _availableTimeSlotCard(
                          day: 'SAT',
                          weekday: 6,
                          controller: [
                            startTimeController6,
                            endTimeController6,
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  PrimaryBtn(
                    ontap: () {
                      if (_formKey.currentState!.validate()) {
                        final schoolId =
                            context.read<SchoolBloc>().state.schoolInfo!.id;
                        context.read<AvailabiltyBloc>().add(
                              AddAvailableDates(
                                schoolId: schoolId,
                                payload: getPayload(),
                              ),
                            );
                      }
                    },
                    text: 'Save',
                    fontSize: 14,
                    hm: 0,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _availableTimeSlotCard({
    required String day,
    required int weekday,
    required List<TextEditingController> controller,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Checkbox(
            value: selectedWeekdays.contains(weekday) || false,
            onChanged: (val) {
              setState(() {
                if (val!) {
                  if (selectedWeekdays.contains(weekday)) {
                    return;
                  }
                  selectedWeekdays.add(weekday);
                } else {
                  selectedWeekdays.remove(weekday);
                }
              });
            },
            activeColor: KorbilTheme.of(context).primaryColor,
          ),
          SizedBox(
            width: 30,
            child: Text(
              day,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: KorbilTheme.of(context).secondaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          SizedBox(
            width: 90,
            child: _entryForm(
              context,
              controller: controller[0],
              weekday: weekday,
              label: 'Start time',
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
            width: 90,
            child: _entryForm(
              context,
              controller: controller[1],
              weekday: weekday,
              label: 'End time',
            ),
          ),
        ],
      ),
    );
  }

  Widget _entryForm(
    BuildContext context, {
    required TextEditingController controller,
    required String label,
    required int weekday,
  }) {
    final th = KorbilTheme.of(context);
    final regExp = RegExp(r'^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$');
    return TextFormField(
      controller: controller,
      validator: (val) {
        if (selectedWeekdays.contains(weekday)) {
          if (val == null || val.isEmpty) {
            return label;
          } else if (!regExp.hasMatch(val)) {
            return '24hr HH:mm';
          } else {
            return null;
          }
        } else {
          return null;
        }
      },
      enabled: selectedWeekdays.contains(weekday) || false,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: th.secondaryColor,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 8,
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
    );
  }

  Map<String, dynamic> getPayload() {
    final availableTime = <AvailableTime>[];

    InputData getTime(int weekday) {
      switch (weekday) {
        case 0:
          return InputData(
            weekday: weekday,
            startTime: DateFormat.Hm().parse(startTimeController0.text),
            endTime: DateFormat.Hm().parse(endTimeController0.text),
          );
        case 1:
          return InputData(
            weekday: weekday,
            startTime: DateFormat.Hm().parse(startTimeController1.text),
            endTime: DateFormat.Hm().parse(endTimeController1.text),
          );
        case 2:
          return InputData(
            weekday: weekday,
            startTime: DateFormat.Hm().parse(startTimeController2.text),
            endTime: DateFormat.Hm().parse(endTimeController2.text),
          );
        case 3:
          return InputData(
            weekday: weekday,
            startTime: DateFormat.Hm().parse(startTimeController3.text),
            endTime: DateFormat.Hm().parse(endTimeController3.text),
          );
        case 4:
          return InputData(
            weekday: weekday,
            startTime: DateFormat.Hm().parse(startTimeController4.text),
            endTime: DateFormat.Hm().parse(endTimeController4.text),
          );
        case 5:
          return InputData(
            weekday: weekday,
            startTime: DateFormat.Hm().parse(startTimeController5.text),
            endTime: DateFormat.Hm().parse(endTimeController5.text),
          );
        case 6:
          return InputData(
            weekday: weekday,
            startTime: DateFormat.Hm().parse(startTimeController6.text),
            endTime: DateFormat.Hm().parse(endTimeController6.text),
          );
        default:
          return InputData(
            weekday: weekday,
            startTime: DateFormat.Hm().parse(startTimeController0.text),
            endTime: DateFormat.Hm().parse(endTimeController0.text),
          );
      }
    }

    // for (final item in selectedWeekdays) {
    //   availableTime.add(
    //     AvailableTime(
    //       weekday: item,
    //       availableHours: [
    //         AvailableHour(
    //           startTime: Time(
    //             hour: getTime(item).startTime.hour,
    //             minute: getTime(item).startTime.minute,
    //           ),
    //           endTime: Time(
    //             hour: getTime(item).endTime.hour,
    //             minute: getTime(item).endTime.minute,
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }

    return {
      'availableDays': [
        for (final item in selectedWeekdays)
          {
            'weekday': item,
            'availableHours': [
              {
                'startTime': {
                  'hour': getTime(item).startTime.hour,
                  'minute': getTime(item).startTime.minute,
                  'second': 0,
                  'nano': 0
                },
                'endTime': {
                  'hour': getTime(item).endTime.hour,
                  'minute': getTime(item).endTime.minute,
                  'second': 0,
                  'nano': 0
                }
              }
            ]
          }
      ],
    };
  }
}

class _Calendar extends StatelessWidget {
  const _Calendar({
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
            offset: const Offset(2, 2),
          ),
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

class AvailableTime {
  AvailableTime({
    required this.weekday,
    required this.availableHours,
  });

  int weekday;
  List<AvailableHour> availableHours;
}

class AvailableHour {
  AvailableHour({
    required this.startTime,
    required this.endTime,
  });

  Time startTime;
  Time endTime;
}

class InputData {
  InputData({
    required this.weekday,
    required this.startTime,
    required this.endTime,
  });
  int weekday;
  DateTime startTime;
  DateTime endTime;
}

class _DateDetails {
  _DateDetails(
    this.date,
    this.type,
  );

  final DateTime date;
  final String type;
}

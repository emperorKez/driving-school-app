import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/custom_screen_padding.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/pages/school/bloc/availability/availabilty_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/repository/availbility/model/time_off_day.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddExceptionView extends StatefulWidget {
  const AddExceptionView({super.key});

  @override
  State<AddExceptionView> createState() => _AddExceptionViewState();
}

class _AddExceptionViewState extends State<AddExceptionView> {
  DateTime selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();

  List<TimeOff> timeOffs = <TimeOff>[];
  List<TimeOffDay> timeOffDay = <TimeOffDay>[];

  // final List<_DateDetails> _schedule = [
  //   _DateDetails(
  //     DateTime(2023, 08, 2),
  //     ScheduleStatusTypes.almostbookedWithGroupClass,
  //   ),
  //   _DateDetails(
  //     DateTime(2023, 08, 3),
  //     ScheduleStatusTypes.fullyBooked,
  //   ),
  //   _DateDetails(
  //     DateTime(2023, 08, 8),
  //     ScheduleStatusTypes.fullyBooked,
  //   ),
  //   _DateDetails(
  //     DateTime(2023, 08, 9),
  //     ScheduleStatusTypes.oneOrTwoLeft,
  //   ),
  //   _DateDetails(
  //     DateTime(2023, 08, 10),
  //     ScheduleStatusTypes.onetofiveBooked,
  //   ),
  //   _DateDetails(
  //     DateTime(2023, 08, 20),
  //     ScheduleStatusTypes.onetofiveBooked,
  //   ),
  //   _DateDetails(
  //     DateTime(2023, 08, 21),
  //     ScheduleStatusTypes.fullyBooked,
  //   ),
  //   _DateDetails(
  //     DateTime(2023, 08, 24),
  //     ScheduleStatusTypes.onetofiveBooked,
  //   ),
  //   _DateDetails(
  //     DateTime(2023, 08, 25),
  //     ScheduleStatusTypes.onetofiveBooked,
  //   ),
  //   _DateDetails(
  //     DateTime(2023, 08, 26),
  //     ScheduleStatusTypes.fullyBooked,
  //   ),
  // ];

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
      body: BlocBuilder<AvailabiltyBloc, AvailabiltyState>(
        builder: (context, state) {
          if (state is! AvailabiltyLoaded) {
            return kLoadingWidget(context);
          } else {
            if (state.timeOffDays != null) {
              for (final e in state.timeOffDays!) {
                if (e.date == selectedDate) {
                  timeOffDay.add(e);
                }
              }
            }
            return CustomScreenPadding(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  _mainCalendarWidget(
                    context: context,
                  ),
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
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      timeOffDay.length,
                      (index) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${timeOffDay[index].startTime} - ${timeOffDay[index].endTime}',
                          ),
                          GestureDetector(
                            onTap: () => context.read<AvailabiltyBloc>().add(
                                  DeleteTimeOffDays(
                                    timeOffDay[index].schoolId,
                                    timeOffDay[index].id,
                                  ),
                                ),
                            child: Image.asset(
                              'assets/imgs/ins/lessons/bin.png',
                              width: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      timeOffs.length,
                      (index) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${timeOffs[index].startTime} - ${timeOffs[index].endTime}',
                          ),
                          GestureDetector(
                            onTap: () => setState(() {
                              timeOffs.remove(timeOffs[index]);
                            }),
                            child: Image.asset(
                              'assets/imgs/ins/lessons/bin.png',
                              width: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  _exceptionTimeSlotCard(date: selectedDate),
                  const SizedBox(
                    height: 40,
                  ),
                  PrimaryBtn(
                    ontap: () {
                      final payload = [
                        for (final item in timeOffs)
                          {
                            'date': item.date.toIso8601String(),
                            'name': item.name,
                            'startTime': item.startTime,
                            'endTime': item.endTime,
                          },
                      ];
                      final schoolId =
                          context.read<SchoolBloc>().state.schoolInfo!.id;
                      context.read<AvailabiltyBloc>().add(
                            AddMultipleTimeOffDays(
                              schoolId: schoolId,
                              payload: payload,
                            ),
                          );
                    },
                    text: 'Save',
                    fontSize: 14,
                    hm: 0,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _mainCalendarWidget({required BuildContext context}) {
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
        selectionTextStyle: TextStyle(color: th.primaryColor, fontSize: 24),
        selectionColor: Colors.transparent,
        showNavigationArrow: true,
        onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
          setState(() {
            selectedDate =
                dateRangePickerSelectionChangedArgs.value as DateTime;
          });
        },
        // cellBuilder: (context, cellDetails) {
        //   return LayoutBuilder(
        //     builder: (cxt, cts) {
        //       final date = DateTime(
        //         cellDetails.date.year,
        //         cellDetails.date.month,
        //         cellDetails.date.day,
        //       );

        //       for (var i = 0; i < schedule.length; i++) {
        //         final s = schedule[i];
        //         if (s.date.compareTo(date) == 0) {
        //           switch (s.type) {
        //             case ScheduleStatusTypes.onetofiveBooked:
        //               return ScheduleStatusType1Widget(
        //                 cellDetails: cellDetails,
        //                 cts: cts,
        //               );
        //             case ScheduleStatusTypes.oneOrTwoLeft:
        //               return ScheduleStatusType2Widget(
        //                 cellDetails: cellDetails,
        //                 cts: cts,
        //               );
        //             case ScheduleStatusTypes.almostbookedWithGroupClass:
        //               return ScheduleStatusType3Widget(
        //                 cellDetails: cellDetails,
        //                 cts: cts,
        //               );
        //             case ScheduleStatusTypes.fullyBooked:
        //               return ScheduleStatusType4Widget(
        //                 cellDetails: cellDetails,
        //                 cts: cts,
        //               );
        //             default:
        //               return ScheduleStatusTypeDefaultWidget(
        //                 cellDetails: cellDetails,
        //                 cts: cts,
        //               );
        //           }
        //         }
        //       }

        //       return ScheduleStatusTypeDefaultWidget(
        //         cellDetails: cellDetails,
        //         cts: cts,
        //       );
        //     },
        //   );
        // },
      ),
    );
  }

  Widget _exceptionTimeSlotCard({required DateTime date}) {
    final th = KorbilTheme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Form(
        key: _formKey,
        child: Row(
          children: [
            SizedBox(
              width: 90,
              child: _entryForm(
                context,
                controller: startTimeController,
                label: 'Start time',
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
              width: 90,
              child: _entryForm(
                context,
                controller: endTimeController,
                label: 'End time',
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => setState(() {
                if (_formKey.currentState!.validate()) {
                  final startTime = '${startTimeController.text}:00';
                  final endTime = '${endTimeController.text}:00';
                  timeOffs.add(
                    TimeOff(
                      date: date,
                      name: 'Time off',
                      startTime: startTime,
                      endTime: endTime,
                    ),
                  );
                  startTimeController.clear();
                  endTimeController.clear();
                }
              }),
              child: Container(
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _entryForm(
    BuildContext context, {
    required TextEditingController controller,
    required String label,
  }) {
    final th = KorbilTheme.of(context);
    final regExp = RegExp(r'^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$');
    return TextFormField(
      controller: controller,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return label;
        } else if (!regExp.hasMatch(val)) {
          return '24hr HH:mm';
        } else {
          return null;
        }
      },
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
}

// class _ExceptionTimeSlotCard extends StatefulWidget {
//   const _ExceptionTimeSlotCard({required this.date});
//   final DateTime date;

//   @override
//   State<_ExceptionTimeSlotCard> createState() => _AvailableTimeSlotCardState();
// }

// class _AvailableTimeSlotCardState extends State<_ExceptionTimeSlotCard> {
//   final _formKey = GlobalKey<FormState>();
//   final startTimeController = TextEditingController();
//   final endTimeController = TextEditingController();
//   bool selected = true;

//   @override
//   Widget build(BuildContext context) {
//     final th = KorbilTheme.of(context);
//     final regExp = RegExp(r'^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$');
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 4),
//       child: Form(
//         key: _formKey,
//         child: Row(
//           children: [
//             SizedBox(
//               width: 70,
//               child: TextFormField(
//                 controller: startTimeController,
//                 validator: (val) {
//                   if (val == null || val.isEmpty) {
//                     return 'Input Start Time';
//                   } else if (!regExp.hasMatch(val)) {
//                     return 'Use 24hour format HH:mm';
//                   } else {
//                     return null;
//                   }
//                 },
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w400,
//                   fontSize: 14,
//                   color: th.secondaryColor,
//                 ),
//                 decoration: InputDecoration(
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 10,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(4),
//                     borderSide: BorderSide(
//                       color: th.alternate2,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(4),
//                     borderSide: BorderSide(
//                       color: th.primaryColor,
//                     ),
//                   ),
//                   errorBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(4),
//                     borderSide: BorderSide(
//                       color: th.warningColor,
//                     ),
//                   ),
//                   hintText: 'HH:MM',
//                   hintStyle: TextStyle(
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w400,
//                     fontSize: 14,
//                     color: th.alternate1,
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 12),
//               child: Text(
//                 '-',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   color: th.secondaryColor,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 70,
//               child: TextFormField(
//                 controller: endTimeController,
//                 validator: (val) {
//                   if (val == null || val.isEmpty) {
//                     return 'Input End Time';
//                   } else if (!regExp.hasMatch(val)) {
//                     return 'Use 24hour format HH:mm';
//                   } else {
//                     return null;
//                   }
//                 },
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w400,
//                   fontSize: 14,
//                   color: th.secondaryColor,
//                 ),
//                 decoration: InputDecoration(
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 10,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(4),
//                     borderSide: BorderSide(
//                       color: th.alternate2,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(4),
//                     borderSide: BorderSide(
//                       color: th.primaryColor,
//                     ),
//                   ),
//                   errorBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(4),
//                     borderSide: BorderSide(
//                       color: th.warningColor,
//                     ),
//                   ),
//                   hintText: 'HH:MM',
//                   hintStyle: TextStyle(
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w400,
//                     fontSize: 14,
//                     color: th.alternate1,
//                   ),
//                 ),
//               ),
//             ),
//             const Spacer(),
//             //todo add gesture detector
//             Image.asset(
//               'assets/imgs/ins/lessons/bin.png',
//               width: 24,
//             ),
//             Container(
//               margin: const EdgeInsets.only(left: 15),
//               width: 30,
//               height: 30,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(4),
//                 color: AppColors.green,
//               ),
//               child: const Center(
//                 child: Icon(
//                   Icons.add,
//                   color: AppColors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _DateDetails {
//   _DateDetails(
//     this.date,
//     this.type,
//   );

//   final DateTime date;
//   final String type;
// }

class TimeOff {
  TimeOff({
    required this.date,
    required this.name,
    required this.startTime,
    required this.endTime,
  });

  DateTime date;
  String name;
  String startTime;
  String endTime;
}

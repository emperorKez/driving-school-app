import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/components/schedule_status_types/type1.dart';
import 'package:korbil_mobile/components/schedule_status_types/type2.dart';
import 'package:korbil_mobile/components/schedule_status_types/type3.dart';
import 'package:korbil_mobile/components/schedule_status_types/type4.dart';
import 'package:korbil_mobile/pages/lessons/views/edit_time_schedule/views/edit_time_schedule.dart';
import 'package:korbil_mobile/pages/lessons/views/home/views/main_calendar_widget.dart';
import 'package:korbil_mobile/pages/lessons/views/home/views/weekly_calendar_widget.dart';
import 'package:korbil_mobile/pages/school/bloc/staff/staff_bloc.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class InstHomeMainBody extends StatefulWidget {
  const InstHomeMainBody({required this.showMainCal, super.key});

  final bool showMainCal;

  @override
  State<InstHomeMainBody> createState() => _InstHomeMainBodyState();
}

class _InstHomeMainBodyState extends State<InstHomeMainBody> {
  String selectedCategory = 'all';

  Container _renderScheduleFilterTypeCard(
    String text, {
    bool selected = false,
  }) {
    final th = KorbilTheme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 8,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: selected ? th.primaryColor : th.alternate1,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
            fontSize: 16,
            color: th.white,
          ),
        ),
      ),
    );
  }

  Future<void> _showScheduleStatusInfo() {
    final th = KorbilTheme.of(context);

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text('Dialog Title'),
          content: Container(
            padding: const EdgeInsets.all(7),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Image.asset(
                    'assets/imgs/ins/auth/warning_green.png',
                    width: 60,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Schedule Statuses',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: th.secondaryColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: ScheduleStatusType1Widget(
                        cts: BoxConstraints(maxWidth: 30, maxHeight: 30),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 5,
                      child: IntrinsicHeight(
                        child: Text(
                          '1 or less than 5 bookings',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: th.secondaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: ScheduleStatusType2Widget(
                        cts: BoxConstraints(maxWidth: 30, maxHeight: 30),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 5,
                      child: IntrinsicHeight(
                        child: Text(
                          'Almost fully booked. one or two slots remaining',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: th.secondaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: ScheduleStatusType3Widget(
                        cts: BoxConstraints(maxWidth: 30, maxHeight: 30),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 5,
                      child: IntrinsicHeight(
                        child: Text(
                          'Almost booked with a group class',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: th.secondaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: ScheduleStatusType4Widget(
                        cts: BoxConstraints(maxWidth: 30, maxHeight: 30),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 5,
                      child: IntrinsicHeight(
                        child: Text(
                          'Fully booked',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: th.secondaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryBtn(
                  text: 'OK',
                  ontap: () {
                    Navigator.pop(context);
                  },
                  vm: 10,
                  hm: 0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    final th = KorbilTheme.of(context);
    return Material(
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height:
                getPreferedOrientation(context) == PreferedOrientation.landscape
                    ? null
                    : s.height * 0.7,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const SizedBox(height: 15),
                BlocBuilder<StaffBloc, StaffState>(
                  builder: (context, state) {
                    return state is! StaffLoaded
                        ? kLoadingWidget(context)
                        : Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/imgs/ins/lessons/avatar1.png',
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    DateTime.now().hour < 12.00
                                        ? 'Hello Good Morning'
                                        : (DateTime.now().hour >= 12.00 &&
                                                DateTime.now().hour < 19.00)
                                            ? 'Hello Good Afternoon'
                                            : 'Hello Good Evening',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          getPreferedOrientation(context) ==
                                                  PreferedOrientation.landscape
                                              ? 24
                                              : 14,
                                      color: th.secondaryColor,
                                    ),
                                  ),
                                  Text(
                                    '${state.staff!.profile.firstName} ${state.staff!.profile.lastName}',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          getPreferedOrientation(context) ==
                                                  PreferedOrientation.landscape
                                              ? 24
                                              : 16,
                                      color: th.secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 55,
                                height: 55,
                                child: Image.asset(
                                  'assets/imgs/ins/global/bell.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          );
                  },
                ),
                const SizedBox(height: 25),
                if (getPreferedOrientation(context) ==
                    PreferedOrientation.landscape)
                  Container()
                else
                  _buildCategoryCardsPortrait(),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Text(
                      'Time Schedule',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: th.secondaryColor,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: _showScheduleStatusInfo,
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          'assets/imgs/ins/lessons/warning_grey.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (_) => const EditTimeSchedule(),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: Image.asset(
                          'assets/imgs/ins/lessons/add_task.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (getPreferedOrientation(context) ==
                        PreferedOrientation.landscape)
                      _buildCategoryCardsLandscape()
                    else
                      Container(),
                    if (getPreferedOrientation(context) ==
                        PreferedOrientation.landscape)
                      const SizedBox(width: 15)
                    else
                      Container(),
                    Expanded(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease,
                        child: widget.showMainCal
                            ? MainCalendarWidget(
                                category: selectedCategory,
                              )
                            : InstWeeklyCalendar(
                                category: selectedCategory,
                              ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getPreferedOrientation(context) ==
                          PreferedOrientation.landscape
                      ? 15
                      : 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCardsLandscape() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.2,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => setState(() {
              selectedCategory = 'all';
            }),
            child: _renderScheduleFilterTypeCard(
              'All',
              selected: selectedCategory == 'all' || false,
            ),
          ),
          const SizedBox(height: 7),
          GestureDetector(
            onTap: () => setState(() {
              selectedCategory = 'individual';
            }),
            child: _renderScheduleFilterTypeCard(
              'Individual',
              selected: selectedCategory == 'individual' || false,
            ),
          ),
          const SizedBox(height: 7),
          GestureDetector(
            onTap: () => setState(() {
              selectedCategory = 'group';
            }),
            child: _renderScheduleFilterTypeCard(
              'Group',
              selected: selectedCategory == 'group' || false,
            ),
          ),
        ],
      ),
    );
  }

  Row _buildCategoryCardsPortrait() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => setState(() {
              selectedCategory = 'all';
            }),
            child: _renderScheduleFilterTypeCard(
              'All',
              selected: selectedCategory == 'all' || false,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: GestureDetector(
            onTap: () => setState(() {
              selectedCategory = 'individual';
            }),
            child: _renderScheduleFilterTypeCard(
              'Individual',
              selected: selectedCategory == 'individual' || false,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () => setState(() {
              selectedCategory = 'group';
            }),
            child: _renderScheduleFilterTypeCard(
              'Group',
              selected: selectedCategory == 'group' || false,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/lessons/lesson_step_card.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/single_lesson_step_card.dart';
import 'package:korbil_mobile/pages/lessons/bloc/calender/calender_cubit.dart';
import 'package:korbil_mobile/repository/lesson/model/calender.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class HomeSlideUpPanel extends StatefulWidget {
  const HomeSlideUpPanel({
    this.scrollController,
    super.key,
  });
  final ScrollController? scrollController;

  @override
  State<HomeSlideUpPanel> createState() => _HomeSlideUpPanelState();
}

class _HomeSlideUpPanelState extends State<HomeSlideUpPanel> {
  String _selectedCategory = 'Booked';
  int activeStep = 2;

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    final th = KorbilTheme.of(context);
    return ListView(
      shrinkWrap: true,
      controller: widget.scrollController,
      physics: getPreferedOrientation(context) == PreferedOrientation.landscape
          ? const NeverScrollableScrollPhysics()
          : null,
      children: [
        const SizedBox(height: 15),
        Container(
          color: th.white,
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 80,
                  height: 6,
                  decoration: BoxDecoration(
                    color: th.alternate2,
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  LessonCategoryTab(
                    s: s,
                    title: 'Booked',
                    ontap: (String val) {
                      setState(() {
                        _selectedCategory = val;
                      });
                    },
                    selected: _selectedCategory == 'Booked',
                  ),
                  LessonCategoryTab(
                    s: s,
                    title: 'Completed',
                    ontap: (String val) {
                      setState(() {
                        _selectedCategory = val;
                      });
                    },
                    selected: _selectedCategory == 'Completed',
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: s.width,
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 30,
            bottom: 30,
          ),
          child: BlocBuilder<CalenderCubit, CalenderState>(
            builder: (context, state) {
              if (state is! CalenderLoaded) {
                return kLoadingWidget(context);
              } else {
                return _selectedCategory == 'Booked'
                    ? bookedCalender(state.calender)
                    : completedCalender(state.completedCalender);
              }

              // return ListView.builder(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemCount: _steps.length,
              //   itemBuilder: (cxt, index) {
              //     final step = _steps.elementAt(index);
              //     var isNextCompleted = false;
              //     try {
              //       isNextCompleted = _steps.elementAt(index + 1).isCompleted;
              //     } catch (e) {
              //       print(e);
              //     }
              //     return LessonStepCard(
              //       reached: step.isCompleted,
              //       step: step,
              //       isFirst: index == 0,
              //       isLast: index == (_steps.length - 1),
              //       isNextCompleted: isNextCompleted,
              //     );
              //   },
              // );
            },
          ),
        ),
      ],
    );
  }
}

Widget bookedCalender(List<Calender> bookedCalender) {
  return bookedCalender.isEmpty
      ? const SizedBox()
      : ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: bookedCalender.length,
          itemBuilder: (context, index) {
            final item = bookedCalender[index];
            final step = StepDetails(
              title: item.title,
              time: item.scheduledTime,
              duration: item.duration.toString(),
              name: '${item.student.firstName} ${item.student.lastName}',
              location: item.location.address,
            );
            // final step = _steps.elementAt(index);
            var isNextCompleted = false;
            try {
              isNextCompleted = false;
            } catch (e) {
              print(e);
            }
            return  LessonStepCard(
              calender: bookedCalender[index],
                reached: step.isCompleted,
                step: step,
                isFirst: index == 0,
                isLast: index == (bookedCalender.length - 1),
                isNextCompleted: isNextCompleted, 
            );
          },
        );
}

Widget completedCalender(List<Calender> completedCalender) {
  return completedCalender.isEmpty
      ? const SizedBox()
      : ListView.builder(
          itemCount: completedCalender.length,
          itemBuilder: (context, index) {
            final item = completedCalender[index];
            return SingleLessonStepCard(
              calender: completedCalender[index],
              step: StepDetails(
                title: item.title,
                time: item.scheduledTime,
                duration: item.duration.toString(),
                name: '${item.student.firstName} ${item.student.lastName}',
                location: item.location.address,
                isCompleted: true,
              ),
            );
          },
        );
}

class LessonCategoryTab extends StatelessWidget {
  const LessonCategoryTab({
    required this.s,
    required this.title,
    required this.ontap,
    required this.selected,
    super.key,
  });

  final Size s;
  final String title;
  final Function ontap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final th = KorbilTheme.of(context);
    return GestureDetector(
      onTap: () {
        // ignore: avoid_dynamic_calls
        ontap(title);
      },
      child: SizedBox(
        width: s.width * 0.42,
        // padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                fontSize: 14,
                color: selected ? th.primaryColor : th.secondaryColor,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: selected ? s.width * 0.42 : 0,
              height: 6,
              decoration: BoxDecoration(
                color: th.primaryColor,
                borderRadius: BorderRadius.circular(13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

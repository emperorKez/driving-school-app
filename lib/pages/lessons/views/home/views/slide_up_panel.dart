import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/lessons/lesson_step_card.dart';
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
  final List<StepDetails> _steps = [
    StepDetails(
      title: 'Safety Courses on Road',
      time: '3 June, 10:00 am',
      duration: '60 min',
      name: 'Mikael Anders',
      location: 'Aniaraplatsen 6, 191 47 Sollentuna, Sweden',
      isCompleted: true,
    ),
    StepDetails(
      title: '90 Min Traffic Light Drive',
      time: '3 June, 11:00 am',
      duration: '90 min',
      name: 'Rosemary Fisher',
      isCompleted: true,
    ),
    StepDetails(
      title: 'End-of Step 2 Assessment',
      time: '3 June, 13:00 pm',
      duration: '60 min',
      name: 'Group Class',
      isCompleted: true,
    ),
    StepDetails(
      title: '90 Min Traffic Light Drive',
      time: '3 June, 11:00 am',
      duration: '90 min',
      name: 'Rosemary Fisher',
    ),
    StepDetails(
      title: 'End-of Step 2 Assessment',
      time: '3 June, 13:00 pm',
      duration: '60 min',
      name: 'Group Class',
    ),
  ];

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
                      selected: _selectedCategory == 'Booked'),
                  LessonCategoryTab(
                      s: s,
                      title: 'Completed',
                      ontap: (String val) {
                        setState(() {
                          _selectedCategory = val;
                        });
                      },
                      selected: _selectedCategory == 'Completed'),
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
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _steps.length,
            itemBuilder: (cxt, index) {
              final step = _steps.elementAt(index);
              var isNextCompleted = false;
              try {
                isNextCompleted = _steps.elementAt(index + 1).isCompleted;
              } catch (e) {
                print(e);
              }
              return LessonStepCard(
                reached: step.isCompleted,
                step: step,
                isFirst: index == 0,
                isLast: index == (_steps.length - 1),
                isNextCompleted: isNextCompleted,
              );
            },
          ),
        ),
      ],
    );
  }
}

class LessonCategoryTab extends StatelessWidget {
  const LessonCategoryTab({
    super.key,
    required this.s,
    required this.title,
    required this.ontap,
    required this.selected,
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

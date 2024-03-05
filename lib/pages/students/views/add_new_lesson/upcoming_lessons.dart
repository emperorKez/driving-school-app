import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:korbil_mobile/theme/theme.dart';

class UpcomingLessonsListWidget extends StatelessWidget {
  const UpcomingLessonsListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (cxt, index) => const _UpcomingLessonTypeCard(),
    );
  }
}

class _UpcomingLessonTypeCard extends StatefulWidget {
  const _UpcomingLessonTypeCard({
    super.key,
  });

  @override
  State<_UpcomingLessonTypeCard> createState() =>
      _UpcomingLessonTypeCardState();
}

class _UpcomingLessonTypeCardState extends State<_UpcomingLessonTypeCard> {
  bool _bookingEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (cxt) {},
              label: 'Remove',
              foregroundColor: KorbilTheme.of(context).white,
              backgroundColor: KorbilTheme.of(context).warningColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: KorbilTheme.of(context).alternate1),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  Text(
                    'Enable for booking',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: KorbilTheme.of(context).secondaryColor,
                    ),
                  ),
                  Switch(
                    value: _bookingEnabled,
                    onChanged: (val) {
                      setState(() {
                        _bookingEnabled = val;
                      });
                    },
                    activeColor: KorbilTheme.of(context).primaryColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 12, top: 5),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: KorbilTheme.of(context).primaryColor,
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/imgs/ins/lessons/traffic_lights.png',
                        width: 35,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '90 Min Traffic Light Drive',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: KorbilTheme.of(context).secondaryColor,
                          ),
                        ),
                        Text(
                          'Start Date 2022/06/26',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: KorbilTheme.of(context).secondaryColor,
                          ),
                        ),
                        Text(
                          'Duration : 90min',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: KorbilTheme.of(context).secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Image.asset(
                      'assets/imgs/ins/profile/add_task_green.png',
                      width: 18,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pick up location',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: KorbilTheme.of(context).secondaryColor,
                          ),
                        ),
                        Text(
                          'Bergmansgatan 20, 431 30 Mölndal',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: KorbilTheme.of(context).secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/imgs/ins/profile/scheduled.png',
                          width: 25,
                        ),
                        Text(
                          '----/--/--',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: KorbilTheme.of(context).secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

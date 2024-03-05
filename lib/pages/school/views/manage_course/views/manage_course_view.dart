import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

import 'profile_section.dart';
import 'student_card.dart';
import 'total_lessons.dart';

class InstManageCourseView extends StatefulWidget {
  const InstManageCourseView({super.key});

  @override
  State<InstManageCourseView> createState() => _InstManageCourseViewState();
}

class _InstManageCourseViewState extends State<InstManageCourseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getPreferedOrientation(context) == PreferedOrientation.landscape
          ? null
          : AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text(
                'Users',
                style: TextStyle(
                  fontFamily: 'Lato',
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              leading: const InstAppBarBackBtn(),
              actions: const [
                _AppBarMenu(),
              ],
            ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: const [
            SizedBox(
              height: 10,
            ),
            ProfileSection(),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TotalLessons(
                  text: 'Total lessons',
                  val: '109',
                  icon: 'assets/imgs/ins/school/lesson_vid.png',
                ),
                TotalLessons(
                  text: 'Working hours',
                  val: '1k Hrs',
                  icon: 'assets/imgs/ins/school/clock.png',
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TotalLessons(
                  text: 'Ongoing lessons',
                  val: '22',
                ),
                TotalLessons(
                  text: 'Future assigned',
                  val: '39',
                ),
                TotalLessons(
                  text: 'Total KMs',
                  val: '22',
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Top 3 Students',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            StudentCard(),
            StudentCard(),
            StudentCard(),
            StudentCard(),
            StudentCard(),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBarMenu extends StatelessWidget {
  const _AppBarMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      splashRadius: 8,
      itemBuilder: (ctx) => const [
        PopupMenuItem<String>(
          value: 'Change user type',
          child: Text(
            'Change user type',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: 'Deactivate user',
          child: Text(
            'Deactivate user',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
        )
      ],
    );
  }
}

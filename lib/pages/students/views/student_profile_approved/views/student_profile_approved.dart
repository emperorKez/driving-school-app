// ignore_for_file: always_use_package_imports

import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/custom_screen_padding.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/pages/students/views/manage_student_lesson/views/manage_student_lesson.dart';
import 'package:korbil_mobile/pages/students/views/profile_package_history/views/profile_package_history.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

import 'feedback_card.dart';
import 'inst_list.dart';
import 'lesson_detail_card.dart';
import 'profile_section.dart';
import 'stat_progress_item.dart';
import 'stats.dart';

class StudentProfileApproved extends StatelessWidget {
  const StudentProfileApproved({super.key});

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Lato',
            color: KorbilTheme.of(context).secondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: const InstAppBarBackBtn(),
        actions: const [_AppBarAction()],
      ),
      body: getPreferedOrientation(context) == PreferedOrientation.landscape
          ? Row(
              children: [
                Expanded(child: _buildLandscapeLeft(context, s)),
                const SizedBox(width: 20),
                Expanded(child: _buildLandscapeRight(context)),
              ],
            )
          : ListView(
              children: [
                _buildLandscapeLeft(context, s),
                const SizedBox(height: 35),
                _buildLandscapeRight(context),
                const SizedBox(height: 50),
              ],
            ),
    );
  }

  Widget _buildLandscapeRight(BuildContext context) {
    return ListView(
      children: [
        CustomScreenPadding(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Instructor comments',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: KorbilTheme.of(context).secondaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                width: 50,
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: KorbilTheme.of(context).primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const CustomScreenPadding(
          child: InstFeedBackCard(),
        ),
        const SizedBox(height: 20),
        CustomScreenPadding(
          child: Text(
            'Recent Lessons',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).secondaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 15),
        const CustomScreenPadding(
          child: LessonDetailCard(
            title: 'Traffic Light Drive',
            subTitle: 'Completed Date 2022/06/26',
          ),
        ),
        const CustomScreenPadding(
          child: LessonDetailCard(
            title: 'Traffic Light Drive',
            subTitle: 'Completed Date 2022/06/26',
          ),
        ),
        const CustomScreenPadding(
          child: LessonDetailCard(
            title: 'Traffic Light Drive',
            subTitle: 'Completed Date 2022/06/26',
          ),
        ),
        const CustomScreenPadding(
          child: LessonDetailCard(
            title: 'Traffic Light Drive',
            subTitle: 'Completed Date 2022/06/26',
          ),
        ),
        const CustomScreenPadding(
          child: LessonDetailCard(
            title: 'Traffic Light Drive',
            subTitle: 'Completed Date 2022/06/26',
          ),
        ),
      ],
    );
  }

  Widget _buildLandscapeLeft(BuildContext context, Size s) {
    return ListView(
      children: [
        const SizedBox(height: 30),
        const ProfileSection(),
        const SizedBox(height: 25),
        const Stats(),
        const SizedBox(height: 10),
        PrimaryBtn(
          ontap: () {
            Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                builder: (cxt) => const ManageStudentLesson(),
              ),
            );
          },
          text: 'Manage Lessons',
          fontSize: 14,
          hm: 25,
        ),
        Container(
          width: double.infinity,
          height:
              getPreferedOrientation(context) == PreferedOrientation.landscape
                  ? null
                  : 80,
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: const InstructorsList(),
        ),
        const SizedBox(height: 15),
        CustomScreenPadding(
          child: Text(
            'Student statistics',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).secondaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 10),
        StatProgressItem(
          s: s,
          title: 'Maneuvering',
          progress: 8,
        ),
        StatProgressItem(
          s: s,
          title: 'Eco-friendly driving',
          progress: 4,
        ),
        StatProgressItem(
          s: s,
          title: 'Rules of the road',
          progress: 8,
        ),
        StatProgressItem(
          s: s,
          title: 'Vehicle knowledge',
          progress: 6,
        ),
        StatProgressItem(
          s: s,
          title: 'Road safety and behavior',
          progress: 10,
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}

class _AppBarAction extends StatelessWidget {
  const _AppBarAction();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<dynamic>(
            builder: (_) => const ProfilePackageHistory(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Image.asset(
          'assets/imgs/ins/profile/gear.png',
          width: 22,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/custom_screen_padding.dart';
import 'package:korbil_mobile/pages/students/students.dart';
import 'package:korbil_mobile/pages/students/views/add_new_lesson/add_lesson.dart';
import 'package:korbil_mobile/pages/students/views/add_new_lesson/competed_lessons.dart';
import 'package:korbil_mobile/pages/students/views/add_new_lesson/upcoming_lessons.dart';
import 'package:korbil_mobile/theme/theme.dart';

class ManageStudentLesson extends StatefulWidget {
  const ManageStudentLesson({super.key});

  @override
  State<ManageStudentLesson> createState() => _ManageStudentLessonState();
}

class _ManageStudentLessonState extends State<ManageStudentLesson> {
  int _selectedType = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Lessons',
          style: TextStyle(
            fontFamily: 'Lato',
            color: KorbilTheme.of(context).secondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: const InstAppBarBackBtn(),
        actions: [
          _AppBarAction(ontap: () {
            Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                builder: (_) => const ManageLessonAddLessonView(),
              ),
            );
          }),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          CustomScreenPadding(
            child: _buildTypeCards(),
          ),
          const SizedBox(
            height: 15,
          ),
          if (_selectedType == 1)
            const UpcomingLessonsListWidget()
          else
            const CompletedLessonsListWidget(),
        ],
      ),
    );
  }

  Row _buildTypeCards() {
    return Row(
      children: [
        Expanded(
          child: ManageStudentLessonTypeCard(
            lessonCount: '5',
            hoursCount: '10',
            selected: _selectedType == 1,
            type: 1,
            ontap: (int val) {
              setState(() {
                _selectedType = val;
              });
            },
          ),
        ),
        const SizedBox(
          width: 7,
        ),
        Expanded(
          child: ManageStudentLessonTypeCard(
            lessonCount: '5',
            hoursCount: '10',
            selected: _selectedType == 2,
            type: 2,
            ontap: (int val) {
              setState(() {
                _selectedType = val;
              });
            },
          ),
        ),
      ],
    );
  }
}

class _AppBarAction extends StatelessWidget {
  const _AppBarAction({
    required this.ontap,
    super.key,
  });

  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: KorbilTheme.of(context).primaryColor,
        ),
        child: Center(
          child: Text(
            '+ New Lesson',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

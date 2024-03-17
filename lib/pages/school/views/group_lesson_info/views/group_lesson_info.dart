import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/custom_screen_padding.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/pages/school/bloc/group_lesson/group_lesson_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/staff/staff_bloc.dart';
import 'package:korbil_mobile/pages/school/views/edit_group_lesson/views/edit_group_lesson.dart';
import 'package:korbil_mobile/pages/school/views/group_lesson_info/views/add_studnet_btn.dart';
import 'package:korbil_mobile/pages/school/views/group_lesson_info/views/details_card.dart';
import 'package:korbil_mobile/repository/group_lesson/models/group_lesson.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class GroupLessonInfo extends StatefulWidget {
  const GroupLessonInfo({required this.lesson, super.key});
  final Lesson lesson;

  @override
  State<GroupLessonInfo> createState() => _GroupLessonInfoState();
}

class _GroupLessonInfoState extends State<GroupLessonInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getPreferedOrientation(context) == PreferedOrientation.landscape
          ? null
          : _buildAppBar(),
      body: CustomScreenPadding(
        child: BlocBuilder<GroupLessonBloc, GroupLessonState>(
          builder: (context, state) {
            return state is! GroupLessonLoaded
                ? kLoadingWidget(context)
                : ListView(
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Students',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: AppColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          AddStudentButon(),
                        ],
                      ),
                      for (final element
                          in widget.lesson.groupLessonStudentRefs)
                        InstUserDetailsCard(
                          studentRef: element,
                        ),
                    ],
                  );
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        'Group Lesson  Information',
        style: TextStyle(
          fontFamily: 'Lato',
          color: AppColors.black,
          fontSize: 16,
          fontWeight: FontWeight.w800,
        ),
      ),
      leading: const InstAppBarBackBtn(),
      actions: [
        PopupMenuButton<Text>(
          itemBuilder: (cxt) => [
            PopupMenuItem(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (_) => EditGroupLessonView(
                        lesson: widget.lesson,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Edit Group',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            PopupMenuItem(
              onTap: () => context.read<GroupLessonBloc>().add(
                  DeleteGroupLesson(
                      groupLessonId: widget.lesson.id,
                      schoolId: context
                          .read<StaffBloc>()
                          .state
                          .staff!
                          .staffData
                          .schoolId,),),
              child: const Text(
                'Delete Group',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/custom_screen_padding.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/pages/school/views/edit_group_lesson/views/edit_group_lesson.dart';
import 'package:korbil_mobile/pages/school/views/group_lesson_info/views/add_studnet_btn.dart';
import 'package:korbil_mobile/pages/school/views/group_lesson_info/views/details_card.dart';
import 'package:korbil_mobile/pages/school/views/manage_school/bloc/school_info/school_info_bloc.dart';
import 'package:korbil_mobile/repos/manage_school_repo/models/school_info.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class GroupLessonInfo extends StatefulWidget {
  const GroupLessonInfo({super.key});

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
        child: BlocBuilder<SchoolInfoBloc, SchoolInfoState>(
          builder: (context, state) {
            return state is SchoolInfoLoaded ? ListView.builder(
              shrinkWrap: true,
              itemCount: state.schoolInfo!.groupLessons!.length,
              itemBuilder: (context, index) {
                ListView(
              children:  [
                
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
                // List.generate(state.schoolInfo!.groupLessons![index].groupLessonStudentRefs!.length, (studentIndex) => Container());
                for (var element in state.schoolInfo!.groupLessons![index].groupLessonStudentRefs!)
                
                 InstUserDetailsCard(studentRef: element,),
                // const InstUserDetailsCard(),
                // const InstUserDetailsCard(),
                // const InstUserDetailsCard(),
                // const InstUserDetailsCard(),
              ],
            )
                
              },)
             : kLoadingWidget(context);
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
                      builder: (_) => const EditGroupLessonView(),
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
            const PopupMenuItem(
              child: Text(
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

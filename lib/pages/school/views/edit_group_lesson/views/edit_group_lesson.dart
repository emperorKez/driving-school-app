import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/custom_screen_padding.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/pages/school/bloc/group_lesson/group_lesson_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/staff/staff_bloc.dart';
import 'package:korbil_mobile/repository/group_lesson/models/group_lesson.dart';
import 'package:korbil_mobile/theme/theme.dart';

class EditGroupLessonView extends StatefulWidget {
  const EditGroupLessonView({required this.lesson, super.key});
  final Lesson lesson;

  @override
  State<EditGroupLessonView> createState() => _EditGroupLessonViewState();
}

class _EditGroupLessonViewState extends State<EditGroupLessonView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController seatController = TextEditingController();
  int selectedStaffId = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Edit Group Lesson',
          style: TextStyle(
            fontFamily: 'Lato',
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: const InstAppBarBackBtn(),
      ),
      body: CustomScreenPadding(
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Instructor',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.grey1),
              ),
              child: DropdownButton<dynamic>(
                isExpanded: true,
                underline: Container(),
                iconSize: 25,
                hint: const Text(
                  'Select Instructor',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                iconDisabledColor: AppColors.black,
                iconEnabledColor: AppColors.black,
                items: context
                    .read<SchoolBloc>()
                    .state
                    .schoolInfo!
                    .staff
                    .map<DropdownMenuItem<dynamic>>((e) {
                  return DropdownMenuItem<dynamic>(
                    value: e.staffData.id,
                    child:
                        Text('${e.profile.firstName} ${e.profile.firstName}'),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    selectedStaffId = val as int;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Avalible Seats',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: TextFormField(
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      // isDense: true,
                      suffixIconConstraints: const BoxConstraints(
                        maxHeight: 48,
                      ),
                      suffixIcon: Container(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 2,
                            ),
                            GestureDetector(
                              onTap: () {
                                var intValue = int.parse(seatController.text);
                                intValue += 1;
                                setState(() {
                                  seatController.text = intValue.toString();
                                });
                              },
                              child: Image.asset(
                                'assets/imgs/ins/school/drop_up.png',
                                width: 12,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                var intValue = int.parse(seatController.text);
                                intValue -= 1;
                                setState(() {
                                  seatController.text = intValue.toString();
                                });
                              },
                              child: Image.asset(
                                'assets/imgs/ins/school/drop_down.png',
                                width: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: AppColors.grey1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: AppColors.green,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: AppColors.red,
                        ),
                      ),
                      contentPadding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 12,
                        bottom: 12,
                      ),
                      hintText: 'Seats',
                      hintStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            const SizedBox(
              height: 35,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      decoration: BoxDecoration(
                        color: KorbilTheme.of(context).white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: KorbilTheme.of(context).secondaryColor,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Close',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: KorbilTheme.of(context).secondaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: BlocBuilder<GroupLessonBloc, GroupLessonState>(
                    builder: (context, state) {
                      return state is! GroupLessonLoaded
                          ? kLoadingWidget(context)
                          : PrimaryBtn(
                              ontap: () {
                                final schoolId = context
                                    .read<StaffBloc>()
                                    .state
                                    .staff!
                                    .staffData
                                    .schoolId;
                                if (_formKey.currentState!.validate()) {
                                  final payload = {
                                    'staffId': selectedStaffId,
                                    'seats': int.parse(seatController.text),
                                  };
                                  context.read<GroupLessonBloc>().add(
                                      UpdateGroupLesson(
                                          groupLessonId: widget.lesson.id,
                                          payload: payload,
                                          schoolId: schoolId,),);
                                }
                              },
                              text: 'Add',
                              vm: 0,
                              hm: 0,
                              fontSize: 14,
                            );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

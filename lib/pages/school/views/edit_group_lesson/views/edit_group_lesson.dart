import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/custom_screen_padding.dart';
import 'package:korbil_mobile/global/constants/colors.dart';

class EditGroupLessonView extends StatefulWidget {
  const EditGroupLessonView({super.key});

  @override
  State<EditGroupLessonView> createState() => _EditGroupLessonViewState();
}

class _EditGroupLessonViewState extends State<EditGroupLessonView> {
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
              child: DropdownButton<String>(
                isExpanded: true,
                underline: Container(),
                iconSize: 25,
                hint: const Text(
                  'Glenn Musa',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                iconDisabledColor: AppColors.black,
                iconEnabledColor: AppColors.black,
                items: const [
                  DropdownMenuItem<String>(
                    value: 'item1',
                    child: Text(
                      'Item 1',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'item2',
                    child: Text(
                      'Item 2',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                  )
                ],
                onChanged: (val) {},
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
                              child: Image.asset(
                                'assets/imgs/ins/school/drop_up.png',
                                width: 12,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
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
          ],
        ),
      ),
    );
  }
}

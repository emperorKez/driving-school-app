import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/pages/school/bloc/course/course_bloc.dart';
import 'package:korbil_mobile/theme/theme.dart';

class InstAddNewCourse extends StatefulWidget {
  const InstAddNewCourse({super.key});

  @override
  State<InstAddNewCourse> createState() => _InstAddNewCourseState();
}

class _InstAddNewCourseState extends State<InstAddNewCourse> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  TextEditingController durationController = TextEditingController();

  String _selectedCourseCategory = 'Group';
  String _selectedCourseType = 'Practical';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Add new Course',
          style: TextStyle(
            fontFamily: 'Lato',
            color: KorbilTheme.of(context).secondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: const InstAppBarBackBtn(),
      ),
      body: _renderMobileBody(),
    );
  }

  Widget _renderMobileBody() {
    return BlocConsumer<CourseBloc, CourseState>(
      listener: (context, state) {
        if (state is CourseError) {
          errorSnackbar(context, error: state.error);
        }
        if (state is CourseLoaded) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          children: [
            const SizedBox(
              height: 15,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Package Title',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).secondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _entryField(
                      hintText: 'Course Title', controller: titleController,),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Course Details',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).secondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _entryField(
                      hintText: 'Course Details',
                      controller: detailController,
                      isMultiLine: true,
                      inputType: TextInputType.multiline,),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Time Duration (minutes)',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).secondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _durationEntryField(),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Course Category',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: KorbilTheme.of(context).secondaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCourseCategory = 'Group';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: _selectedCourseCategory == 'Group'
                            ? KorbilTheme.of(context).primaryColor
                            : KorbilTheme.of(context).white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                        border: Border.all(
                            color: KorbilTheme.of(context).alternate1,),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/imgs/ins/school/group_black.png',
                            height: 15,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Group',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: KorbilTheme.of(context).secondaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCourseCategory = 'Individual';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: _selectedCourseCategory == 'Individual'
                            ? KorbilTheme.of(context).primaryColor
                            : KorbilTheme.of(context).white,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        border: Border.all(
                            color: KorbilTheme.of(context).alternate1,),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/imgs/ins/school/individual_black.png',
                            height: 15,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Individual',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: KorbilTheme.of(context).secondaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Course Type',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: KorbilTheme.of(context).secondaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCourseType = 'Theory';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: _selectedCourseType == 'Theory'
                            ? KorbilTheme.of(context).primaryColor
                            : KorbilTheme.of(context).white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                        border: Border.all(
                            color: KorbilTheme.of(context).alternate1,),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/imgs/ins/school/road_sign.png',
                            height: 15,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Theory',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: KorbilTheme.of(context).secondaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCourseType = 'Practical';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: _selectedCourseType == 'Practical'
                            ? KorbilTheme.of(context).primaryColor
                            : KorbilTheme.of(context).white,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        border: Border.all(
                            color: KorbilTheme.of(context).alternate1,),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/imgs/ins/school/steering_wheel.png',
                            height: 15,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Practical',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: KorbilTheme.of(context).secondaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
                      // margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
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
                  child: state is CourseLoading
                      ? kLoadingWidget(context)
                      : PrimaryBtn(
                          ontap: () {
                            if (_formKey.currentState!.validate()) {
                              final payload = {
                                'id': 0,
                                //todo payload
                              };
                              //todo get school Id for the staff
                              context.read<CourseBloc>().add(
                                  AddCourse(payload: payload, schoolId: 1),);
                            }
                          },
                          text: 'Add',
                          vm: 0,
                          hm: 0,
                          fontSize: 14,
                        ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        );
      },
    );
  }

  Widget _entryField({
    required String hintText,
    required TextEditingController controller,
    bool isMultiLine = false,
    TextInputType inputType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      minLines: isMultiLine ? 6 : null,
      maxLines: isMultiLine ? null : 1,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter $hintText';
        }
        return null;
      },
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: KorbilTheme.of(context).secondaryColor,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: KorbilTheme.of(context).alternate1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: KorbilTheme.of(context).primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: KorbilTheme.of(context).warningColor,
          ),
        ),
        contentPadding: const EdgeInsets.only(
          left: 15,
          right: 10,
          top: 5,
          bottom: 5,
        ),
        hintText: 'Course Title',
        hintStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: KorbilTheme.of(context).alternate1,
        ),
      ),
    );
  }

  Widget _durationEntryField() {
    return TextFormField(
      controller: durationController,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter Course Duration';
        }
        return null;
      },
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: KorbilTheme.of(context).secondaryColor,
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
                  setState(() {
                    int duration = int.parse(durationController.text);
                    durationController.text = (duration += 1).toString();
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
                  setState(() {
                    int duration = int.parse(durationController.text);
                    durationController.text = (duration -= 1).toString();
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
          borderSide: BorderSide(
            color: KorbilTheme.of(context).alternate1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: KorbilTheme.of(context).primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: KorbilTheme.of(context).warningColor,
          ),
        ),
        contentPadding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 12,
          bottom: 12,
        ),
        hintText: 'Course Duration',
        hintStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: KorbilTheme.of(context).alternate1,
        ),
      ),
    );
  }
}

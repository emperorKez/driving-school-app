// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/pages/school/bloc/course/course_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/package/package_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/school/views/edit_package/views/price_breakdown_summary_card.dart';
import 'package:korbil_mobile/repository/package/models/package.dart';
import 'package:korbil_mobile/theme/theme.dart';

class InstEditNewPackageView extends StatefulWidget {
  const InstEditNewPackageView({required this.package, super.key});
  final Package package;

  @override
  State<InstEditNewPackageView> createState() => _InstEditNewPackageViewState();
}

class _InstEditNewPackageViewState extends State<InstEditNewPackageView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  late bool isRecommended;

  @override
  void initState() {
    super.initState();
    titleController.text = widget.package.schoolPackage.title;
    descriptionController.text = widget.package.schoolPackage.description;
    detailController.text = widget.package.schoolPackage.details.toString();
    durationController.text =
        widget.package.schoolPackage.timeDuration.toString();
    priceController.text = widget.package.schoolPackage.price.toString();
    isRecommended = widget.package.schoolPackage.isRecommended;
  }

  final selectedCourses = <int>{};
  bool showSyllabus = false;

  @override
  Widget build(BuildContext context) {
    final schoolId = context.read<SchoolBloc>().state.schoolInfo!.id;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Edit Package',
          style: TextStyle(
            fontFamily: 'Lato',
            color: KorbilTheme.of(context).secondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: const InstAppBarBackBtn(),
      ),
      body: BlocListener<PackageBloc, PackageState>(
        listener: (context, state) {
          if (state is PackageError) {
            errorSnackbar(context, error: state.error);
          }
          if (state is PackageLoaded) {
            //todo success snackbar
            Navigator.pop(context);
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ListView(
            shrinkWrap: true,
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
                      controller: titleController,
                      hintText: 'Package Title',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Package Description',
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
                      controller: descriptionController,
                      hintText: 'Package Description',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Duration (Hours)',
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
                                controller: durationController,
                                hintText: 'Time Duration',
                                inputType: TextInputType.number,
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
                                          var intValue = int.parse(
                                              durationController.text);
                                          intValue += 1;
                                          setState(() {
                                            durationController.text =
                                                intValue.toString();
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
                                          var intValue = int.parse(
                                              durationController.text);
                                          intValue -= 1;
                                          setState(() {
                                            durationController.text =
                                                intValue.toString();
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
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Price',
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
                                controller: priceController,
                                hintText: 'Price',
                                inputType: TextInputType.number,
                                suffixIcon: Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Image.asset(
                                    'assets/imgs/ins/school/dollar.png',
                                    width: 13,
                                  ),
                                ),
                                onChanged: (val) => setState(() {}),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              Text(
                'Price Breakdown Summery ',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              EditPackagePriceBreakdownSummaryCard(
                  price: int.parse(priceController.text.isEmpty
                      ? '0'
                      : priceController.text)),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showSyllabus = true;
                  });
                },
                child: Text(
                  '+ Link a Syllabus ',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: KorbilTheme.of(context).primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (showSyllabus) syllabus() else const SizedBox(),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Text(
                    'Recommended',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Switch(
                    value: isRecommended,
                    onChanged: (val) {
                      setState(() {
                        isRecommended = val;
                      });
                    },
                    activeColor: KorbilTheme.of(context).primaryColor,
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
                    child: PrimaryBtn(
                      ontap: () {
                        {
                          if (_formKey.currentState!.validate()) {
                            final payload = {
                              'title': titleController.text,
                              'description': descriptionController.text,
                              'details': [
                                {
                                  'name': widget
                                      .package.schoolPackage.details[0]['name']
                                },
                              ],
                              // 'details': widget.package.schoolPackage.details,
                              'timeDuration':
                                  int.parse(durationController.text),
                              'price': int.parse(priceController.text),
                              'isRecommended': isRecommended,
                              'schoolId': schoolId,
                              'packageCourseSyllabus': [
                                for (var item in selectedCourses)
                                {'courseId': item},
                              ],
                            };
                            context.read<PackageBloc>().add(UpdatePackage(
                                payload: payload,
                                packageId: widget.package.schoolPackage.id,
                                schoolId: schoolId));
                          }
                        }
                      },
                      text: 'Save',
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
          ),
        ),
      ),
    );
  }

  Widget _entryField({
    required TextEditingController controller,
    required String hintText,
    TextInputType inputType = TextInputType.text,
    bool isMultiline = false,
    Widget? suffixIcon,
    void Function(String)? onChanged,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      minLines: isMultiline ? 6 : null,
      maxLines: isMultiline ? null : 1,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $hintText';
        }
        return null;
      },
      onChanged: onChanged,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: KorbilTheme.of(context).secondaryColor,
      ),
      decoration: InputDecoration(
        // isDense: true,
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 48,
        ),
        suffixIcon: suffixIcon,
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
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: KorbilTheme.of(context).alternate1,
        ),
      ),
    );
  }

  Widget syllabus() {
    final school = context.read<SchoolBloc>().state.schoolInfo!;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: school.schoolStatus != 5
          ? const Text('School is not Active')
          : BlocBuilder<CourseBloc, CourseState>(
              builder: (context, state) {
                if (state is CourseInitial) {
                  context
                      .read<CourseBloc>()
                      .add(GetCourses(schoolId: school.id));
                }
                if (state is! CourseLoaded) {
                  return kLoadingWidget(context);
                } else {
                  return state.courses!.isEmpty
                      ? const Text('No Course Found')
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.courses!.length,
                          itemBuilder: (context, index) {
                            return CheckboxListTile(
                              value: selectedCourses
                                  .contains(state.courses![index].course.id),
                              onChanged: (bool? isSelected) {
                                setState(() {
                                  isSelected == true
                                      ? selectedCourses
                                          .add(state.courses![index].course.id)
                                      : selectedCourses.remove(
                                          state.courses![index].course.id);
                                });
                              },
                              title: Text(state.courses![index].course.title),
                            );
                          });
                }
              },
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/pages/school/bloc/package/package_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/staff/staff_bloc.dart';
import 'package:korbil_mobile/pages/school/views/add_course/views/add_course.dart';
import 'package:korbil_mobile/pages/school/views/create_new_package/views/price_breakdown_summary.dart';
import 'package:korbil_mobile/theme/theme.dart';

class InstCreateNewPackageView extends StatefulWidget {
  const InstCreateNewPackageView({super.key});

  @override
  State<InstCreateNewPackageView> createState() =>
      _InstCreateNewPackageViewState();
}

class _InstCreateNewPackageViewState extends State<InstCreateNewPackageView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  bool isRecommended = true;

  @override
  void initState() {
    priceController.text = '100';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Create New Package',
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
        child: _renderMobileBody(),
      ),
    );
  }

  Container _renderMobileBody() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView(
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
                Text(
                  'Package Details',
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
                  controller: detailController,
                  hintText: 'Package Details',
                  isMultiline: true,
                  inputType: TextInputType.multiline,
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
                            'Time Duration (Minutes)',
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
                                      var intValue =
                                          int.parse(durationController.text);
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
                                      var intValue =
                                          int.parse(durationController.text);
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
          PriceBreakdownSummaryCard(price: int.parse(priceController.text)),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (cxt) => const InstAddCourse(),
                ),
              );
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
                child: BlocBuilder<PackageBloc, PackageState>(
                  builder: (context, state) {
                    return state is PackageLoading
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
                                  'title': titleController.text,
                                  'description': descriptionController.text,
                                  'details': detailController.text,
                                  'timeDuration':
                                      int.parse(durationController.text),
                                  'price': int.parse(priceController.text),
                                  'isRecommended': isRecommended,
                                  'schoolId': schoolId,
                                  'packageCourseSyllabus': [
                                    {'courseId': 0},
                                  ],
                                };
                                context.read<PackageBloc>().add(
                                      AddPackage(
                                        payload: payload,
                                        schoolId: schoolId,
                                      ),
                                    );
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
          const SizedBox(
            height: 40,
          ),
        ],
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

  // Container(
  //                               padding: const EdgeInsets.only(right: 10),
  //                               child: Column(
  //                                 mainAxisAlignment: MainAxisAlignment.center,
  //                                 children: [
  //                                   const SizedBox(
  //                                     height: 2,
  //                                   ),
  //                                   GestureDetector(
  //                                     child: Image.asset(
  //                                       'assets/imgs/ins/school/drop_up.png',
  //                                       width: 12,
  //                                     ),
  //                                   ),
  //                                   const SizedBox(
  //                                     height: 5,
  //                                   ),
  //                                   GestureDetector(
  //                                     child: Image.asset(
  //                                       'assets/imgs/ins/school/drop_down.png',
  //                                       width: 12,
  //                                     ),
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
}

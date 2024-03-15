import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/pages/school/bloc/promotion/promotion_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/school/views/add_new_promo/views/alert_content.dart';
import 'package:korbil_mobile/theme/theme.dart';

class InstAddNewPromoView extends StatefulWidget {
  const InstAddNewPromoView({super.key});

  @override
  State<InstAddNewPromoView> createState() => _InstAddNewPromoViewState();
}

class _InstAddNewPromoViewState extends State<InstAddNewPromoView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController packageTitleController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  int selectedPackageId = 0;
  bool promoteInHome = true;

  Future<bool?> _showConfirmFinishLessonAlert() {
    return showDialog<bool>(
      context: context,
      builder: (_) {
        return const AlertDialog(
          // title: Text('Dialog Title'),
          content: AlertDialogContent(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      // bottomNavigationBar: const PrimaryBottomAppBar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Create New Promo',
          style: TextStyle(
            fontFamily: 'Lato',
            color: KorbilTheme.of(context).secondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: const InstAppBarBackBtn(),
      ),
      body: Container(
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
                    'Select the Package',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).secondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  selectPackage(context),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Add an Offer',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).secondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  _entryField(
                    controller: packageTitleController,
                    hintText: 'Package Title',
                    inputType: TextInputType.number,
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
                              'Start Date',
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
                              controller: startDateController,
                              hintText: 'Enter Date',
                              inputType: TextInputType.datetime,
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
                              'End Date',
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
                              controller: endDateController,
                              hintText: 'Enter Date',
                              inputType: TextInputType.datetime,
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
              'Promotion Details',
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
            _entryWideField(
              controller: detailController,
              hint: 'Promotion Detail',
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text(
                  'Promote in the Home',
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
                  value: true,
                  onChanged: (val) => promoteInHome = val,
                  activeColor: KorbilTheme.of(context).primaryColor,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Promotion fee:',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: KorbilTheme.of(context).secondaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  r'25$ One-time',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: KorbilTheme.of(context).secondaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
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
                  child: BlocBuilder<SchoolBloc, SchoolState>(
                    builder: (context, state) {
                      return state is SchoolLoading ? kLoadingWidget(context):
                           PrimaryBtn(
                              text: 'Submit',
                              vm: 0,
                              hm: 0,
                              fontSize: 14,
                              ontap: () async {
                                if (_formKey.currentState!.validate()) {
                                  final payloadData = <String, dynamic>{
                                    'schoolPackageId': selectedPackageId,
                                    'offer': packageTitleController.text,
                                    'startDate': startDateController.text,
                                    'endDate': endDateController.text,
                                    'details': detailController.text,
                                    'promoteInHome': promoteInHome,
                                  };
                                  if (await _showConfirmFinishLessonAlert() ??
                                      true) {
                                    if (!mounted) return;
                                    context.read<PromotionBloc>().add(
                                          AddPromotion(
                                            payload: payloadData,
                                            schoolId:
                                                state.school!.schoolInfo!.id,
                                          ),
                                        );
                                  }
                                }
                              },
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
      ),
    );
  }

  Widget selectPackage(BuildContext context) {
    return BlocBuilder<SchoolBloc, SchoolState>(
      builder: (context, state) {
        final packages = state.school!.packages;
    final items = List.generate(
      packages!.length,
      (index) => {
        'key': packages[index].schoolPackage.price,
        'value': packages[index].schoolPackage.id
      },
    );
      return state is! SchoolLoaded ? const SizedBox() :
         Padding(
          padding: const EdgeInsets.all(10),
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButtonFormField<int>(
              value: selectedPackageId,
              isExpanded: true,
              decoration: InputDecoration(
                label: const Text('Select the Package'),
                contentPadding: EdgeInsets.zero,
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              items: items.map<DropdownMenuItem<int>>((e) {
                return DropdownMenuItem<int>(
                  value: e['value'],
                  child: Text(e['key'].toString()),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedPackageId =value!;
                });
              },
              hint: const Text('Select the Package'),
              menuMaxHeight: 300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
    );
  }

  Widget _entryField({
    required TextEditingController controller,
    required String hintText,
    TextInputType inputType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $hintText';
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

  Widget _entryWideField({
    required TextEditingController controller,
    required String hint,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      minLines: 6,
      maxLines: null,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter Promotion Detail';
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
          right: 15,
          top: 12,
          bottom: 12,
        ),
        hintText: 'Promotion details',
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

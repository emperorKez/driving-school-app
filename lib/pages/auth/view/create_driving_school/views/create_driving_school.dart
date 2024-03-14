import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/locator.dart';
import 'package:korbil_mobile/nav/nav_service.dart';
import 'package:korbil_mobile/nav/router.dart';
import 'package:korbil_mobile/pages/auth/auth.dart';
import 'package:korbil_mobile/pages/auth/view/create_driving_school/bloc/create_school_bloc.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

enum UploadType { logo, registration }

class CreateDrivingSchoolView extends StatefulWidget {
  const CreateDrivingSchoolView({super.key});

  @override
  State<CreateDrivingSchoolView> createState() =>
      _CreateDrivingSchoolViewState();
}

class _CreateDrivingSchoolViewState extends State<CreateDrivingSchoolView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final s = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: ListView(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.4,
              child: Center(
                child: Image.asset(
                  'assets/imgs/ins/auth/splash_img.png',
                  width: MediaQuery.sizeOf(context).height * 0.4,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Welcome to ',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: getPreferedOrientation(context) ==
                                PreferedOrientation.landscape
                            ? 52
                            : 24,
                        color: AppColors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'körbil',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: getPreferedOrientation(context) ==
                                    PreferedOrientation.landscape
                                ? 52
                                : 32,
                            fontWeight: FontWeight.w800,
                            color: AppColors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  if (getPreferedOrientation(context) ==
                      PreferedOrientation.landscape)
                    Container()
                  else
                    const Text(
                      'Create Driving School',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: AppColors.black,
                      ),
                    ),
                ],
              ),
            ),
            if (getPreferedOrientation(context) ==
                PreferedOrientation.landscape)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Text(
                  'Create Driving School',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: AppColors.black,
                  ),
                ),
              )
            else
              Container(),
            const SizedBox(height: 30),
            Center(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      if (getPreferedOrientation(context) ==
                          PreferedOrientation.landscape)
                        Row(
                          children: [
                            Expanded(
                              child: _renderFormField(
                                hint: 'Enter your Driving School Name',
                                ctrl: nameController,
                                inputType: TextInputType.phone,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Enter your Driving School Name';
                                  }
                                  return null;
                                },
                                icon: 'assets/imgs/ins/auth/school.png',
                              ),
                            ),
                            Expanded(
                              child: _renderFormField(
                                hint: 'Address',
                                ctrl: addressController,
                                inputType: TextInputType.emailAddress,
                                onChanged: (val) {
                                  context
                                      .read<CreateSchoolBloc>()
                                      .add(AddressChanged(address: val));
                                },
                                onEditingComplete: () => context
                                    .read<CreateSchoolBloc>()
                                    .add(ClearAddress()),
                                validator: (val) => context
                                            .read<CreateSchoolBloc>()
                                            .state
                                            .isValidAddress ==
                                        false
                                    ? 'Enter your Driving School Address'
                                    : null,
                                icon: 'assets/imgs/ins/auth/email.png',
                                iconSize: 18,
                              ),
                            ),
                          ],
                        )
                      else
                        Column(
                          children: [
                            _renderFormField(
                              hint: 'Enter your Driving School Name',
                              ctrl: nameController,
                              inputType: TextInputType.phone,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Enter your Driving School Name';
                                }
                                return null;
                              },
                              icon: 'assets/imgs/ins/auth/school.png',
                            ),
                            _renderFormField(
                              hint: 'Address',
                              ctrl: addressController,
                              inputType: TextInputType.emailAddress,
                              onChanged: (val) {
                                context
                                    .read<CreateSchoolBloc>()
                                    .add(AddressChanged(address: val));
                              },
                              onEditingComplete: () => context
                                  .read<CreateSchoolBloc>()
                                  .add(ClearAddress()),
                              validator: (val) => context
                                          .read<CreateSchoolBloc>()
                                          .state
                                          .isValidAddress ==
                                      false
                                  ? 'Enter your Driving School Address'
                                  : null,
                              icon: 'assets/imgs/ins/auth/email.png',
                              iconSize: 18,
                            ),
                          ],
                        ),
                      if (getPreferedOrientation(context) ==
                          PreferedOrientation.landscape)
                        Row(
                          children: [
                            Expanded(
                              child: _renderFormField(
                                hint: 'City',
                                ctrl: cityController,
                                inputType: TextInputType.phone,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Enter your City';
                                  }
                                  return null;
                                },
                                icon: 'assets/imgs/ins/auth/call_green.png',
                                iconSize: 18,
                              ),
                            ),
                            Expanded(
                              child: _renderFormField(
                                hint: 'Enter your Phone',
                                ctrl: phoneController,
                                inputType: TextInputType.emailAddress,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Enter your Phone';
                                  }
                                  return null;
                                },
                                icon: 'assets/imgs/ins/auth/email.png',
                                iconSize: 18,
                              ),
                            ),
                          ],
                        )
                      else
                        Column(
                          children: [
                            _renderFormField(
                              hint: 'City',
                              ctrl: cityController,
                              inputType: TextInputType.phone,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Enter City';
                                }
                                return null;
                              },
                              icon: 'assets/imgs/ins/auth/call_green.png',
                              iconSize: 18,
                            ),
                            _renderFormField(
                              hint: 'Enter your phone',
                              ctrl: phoneController,
                              inputType: TextInputType.emailAddress,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Enter Your Phone';
                                }
                                return null;
                              },
                              icon: 'assets/imgs/ins/auth/email.png',
                              iconSize: 18,
                            ),
                          ],
                        ),
                      if (getPreferedOrientation(context) ==
                          PreferedOrientation.landscape)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 8, top: 12),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Upload Company Logo',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            fontSize: getPreferedOrientation(
                                                      context,
                                                    ) ==
                                                    PreferedOrientation
                                                        .landscape
                                                ? 12
                                                : 14,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () async {
                                        final doc = await pickFile();
                                        if (doc != null) {
                                          if (!mounted) return;
                                          context
                                              .read<CreateSchoolBloc>()
                                              .add(UploadLogo(doc));
                                        }
                                      },
                                      child: _renderUploadBtn(),),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 8, top: 12),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Upload Company Registration Document',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                              fontSize: getPreferedOrientation(
                                                        context,
                                                      ) ==
                                                      PreferedOrientation
                                                          .landscape
                                                  ? 12
                                                  : 14,
                                              color: AppColors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () async {
                                        final doc = await pickFile();
                                        if (doc != null) {
                                          if (!mounted) return;
                                          context
                                              .read<CreateSchoolBloc>()
                                              .add(UploadRegistration(doc));
                                        }
                                      },
                                      child: _renderUploadBtn(),),
                                ],
                              ),
                            ),
                          ],
                        )
                      else
                        Column(
                          children: [
                            Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 8, top: 12),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Upload Company Logo',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () async {
                                      final doc = await pickFile();
                                      if (doc != null) {
                                        if (!mounted) return;
                                        context
                                            .read<CreateSchoolBloc>()
                                            .add(UploadLogo(doc));
                                      }
                                    },
                                    child: _renderUploadBtn(),),
                              ],
                            ),
                            Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 8, top: 12),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Upload Company Registration Document',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () async {
                                      final doc = await pickFile();
                                      if (doc != null) {
                                        if (!mounted) return;
                                        context
                                            .read<CreateSchoolBloc>()
                                            .add(UploadRegistration(doc));
                                      }
                                    },
                                    child: _renderUploadBtn(),),
                              ],
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            BlocConsumer<CreateSchoolBloc, CreateSchoolState>(
              listener: (context, state) {
                if (state is CreateSchoolSuccess) {
                  lc<NavigationService>()
                      .navigateTo(rootNavKey, AppRouter.appHome);
                }
              },
              builder: (context, state) {
                if (state is CreateSchoolLoading) {
                  return kLoadingWidget(context);
                } else {
                  return PrimaryBtn(
                    text: 'Create',
                    ontap: () {
                      if (_formKey.currentState!.validate()) {
                        if (state.logo == null) {
                          errorSnackbar(context, error: 'Upload Company logo');
                        } else if (state.companyRegistration == null) {
                          errorSnackbar(context,
                              error: 'Upload Company registration document',);
                        } else {
                          context
                              .read<CreateSchoolBloc>()
                              .add(CreateSchool(payload: getPayload()));
                        }
                      }
                    },
                    hm: 23,
                  );
                }
              },
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Container _renderUploadBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.green),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/imgs/ins/auth/upload2.png',
              width: 24,
              height: 24,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Upload',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: AppColors.green,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _renderFormField({
    required String hint,
    required TextEditingController ctrl,
    required ValidatorFunctionType validator,
    required String icon,
    double iconSize = 24,
    TextInputType inputType = TextInputType.text,
    Widget? suffixIcon,
    void Function(String)? onChanged,
    void Function()? onEditingComplete,
  }) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: TextFormField(
        controller: ctrl,
        validator: (val) => validator(val),
        onChanged: (value) => onChanged,
        onEditingComplete: () => onEditingComplete,
        keyboardType: inputType,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: AppColors.black,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 15,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: AppColors.grey2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: AppColors.green,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: AppColors.red,
            ),
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.grey1,
          ),
          suffixIcon: suffixIcon,
          prefixIcon: SizedBox(
            width: 50,
            child: Center(
              child: Image.asset(
                icon,
                width: iconSize,
                height: iconSize,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<String?> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
        type: FileType.custom,);
    if (result != null) {
      return result.files.single.path;
    } else {
      // User canceled the picker
      return null;
    }
  }

  Map<String, dynamic> getPayload() {
    return {
      'schoolName': 'string',
      'address': 'string',
      'city': 'string',
      'phoneNo': 'string',
      'languageId': 0,
      'logoKey': 'string',
      'registrationDocumentKey': 'string',
      'staff': {
        'profile': {
          'id': 0,
          'firstName': 'string',
          'lastName': 'string',
          'phoneNumber': 'string',
          'email': 'string',
          'avatar': 'string',
          'userStatus': 0,
          'userType': 0,
          'createdAt': '2024-03-07T11:07:54.759Z',
          'updatedAt': '2024-03-07T11:07:54.759Z',
        },
        'staffData': {
          'userProfileId': 0,
          'documents': [
            {
              'key': 'string',
              'type': 0,
            }
          ],
          'staffRole': 0,
          'schoolId': 0,
        },
      },
    };
  }
}

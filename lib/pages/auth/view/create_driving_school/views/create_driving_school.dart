import 'dart:io';

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
import 'package:korbil_mobile/pages/auth/bloc/create_account/create_account_bloc.dart';
import 'package:korbil_mobile/pages/auth/bloc/create_school/create_school_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/metadata/metadata_cubit.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/staff/staff_bloc.dart';
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
  TextEditingController descriptionController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  File? registrationDoc;
  File? logoDoc;

  bool suggestingAddress = false;

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
                        Column(
                          children: [
                            suggestedAddress(),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: _renderFormField(
                                    hint: 'Enter your Driving School Name',
                                    ctrl: nameController,
                                    inputType: TextInputType.name,
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return 'Enter your Driving School Name';
                                      } else if (context
                                              .read<CreateSchoolBloc>()
                                              .state
                                              .isNameValid ==
                                          false) {
                                        return 'School name is not available';
                                      }
                                      return null;
                                    },
                                    onEditingComplete: () {
                                      context.read<CreateSchoolBloc>().add(
                                            ValidateName(nameController.text),
                                          );
                                    },
                                    onFocusChange: (hasFocus) {
                                      if (!hasFocus) {
                                        context.read<CreateSchoolBloc>().add(
                                              ValidateName(nameController.text),
                                            );
                                      }
                                    },
                                    icon: 'assets/imgs/ins/auth/school.png',
                                  ),
                                ),
                                Expanded(
                                  child: _renderFormField(
                                    hint: 'Address',
                                    ctrl: addressController,
                                    inputType: TextInputType.streetAddress,
                                    onChanged: (val) {
                                      suggestingAddress = true;
                                      context
                                          .read<CreateSchoolBloc>()
                                          .add(AddressChanged(address: val));
                                    },
                                    validator: (val) => val == null ||
                                            val.isEmpty
                                        ? 'Enter your Driving School Address'
                                        : null,
                                    icon: 'assets/imgs/ins/auth/email.png',
                                    iconSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      else
                        Column(
                          children: [
                            _renderFormField(
                              hint: 'Enter your Driving School Name',
                              ctrl: nameController,
                              inputType: TextInputType.name,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Enter your Driving School Name';
                                } else if (context
                                        .read<CreateSchoolBloc>()
                                        .state
                                        .isNameValid ==
                                    false) {
                                  return 'School name is not available';
                                }
                                return null;
                              },
                              onEditingComplete: () {
                                context
                                    .read<CreateSchoolBloc>()
                                    .add(ValidateName(nameController.text));
                              },
                              onFocusChange: (hasFocus) {
                                if (!hasFocus) {
                                  context
                                      .read<CreateSchoolBloc>()
                                      .add(ValidateName(nameController.text));
                                }
                              },
                              icon: 'assets/imgs/ins/auth/school.png',
                            ),
                            suggestedAddress(),
                            _renderFormField(
                              hint: 'Address',
                              ctrl: addressController,
                              inputType: TextInputType.streetAddress,
                              onChanged: (val) {
                                suggestingAddress = true;
                                context
                                    .read<CreateSchoolBloc>()
                                    .add(AddressChanged(address: val));
                              },
                              validator: (val) => val == null || val.isEmpty
                                  ? 'Enter School Address'
                                  : null,
                              icon: 'assets/imgs/ins/auth/email.png',
                              iconSize: 18,
                            ),
                          ],
                        ),
                      _renderFormField(
                        hint: 'About Us',
                        ctrl: descriptionController,
                        isMultiline: true,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Enter About Us';
                          } else if (val.characters.length < 25) {
                            return 'Enter At least 10 words about your school';
                          }
                          return null;
                        },
                        // icon: 'assets/imgs/ins/auth/school.png',
                      ),
                      if (getPreferedOrientation(context) ==
                          PreferedOrientation.landscape)
                        Row(
                          children: [
                            Expanded(
                              child: _renderFormField(
                                hint: 'City',
                                ctrl: cityController,
                                inputType: TextInputType.name,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Enter the City';
                                  }
                                  return null;
                                },
                                icon: 'assets/imgs/ins/auth/email.png',
                                iconSize: 18,
                              ),
                            ),
                            Expanded(
                              child: _renderFormField(
                                hint: 'Enter your Phone',
                                ctrl: phoneController,
                                inputType: TextInputType.number,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Enter your Phone';
                                  }
                                  return null;
                                },
                                icon: 'assets/imgs/ins/auth/call_green.png',
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
                              inputType: TextInputType.name,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Enter the City';
                                }
                                return null;
                              },
                              icon: 'assets/imgs/ins/auth/email.png',
                              iconSize: 18,
                            ),
                            _renderFormField(
                              hint: 'Enter your phone',
                              ctrl: phoneController,
                              inputType: TextInputType.phone,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Enter Your Phone';
                                }
                                return null;
                              },
                              icon: 'assets/imgs/ins/auth/call_green.png',
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
                                  if (logoDoc != null)
                                    SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Image.file(
                                        logoDoc!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  GestureDetector(
                                    onTap: () async {
                                      final doc = await pickFile();
                                      if (doc != null) {
                                        setState(() {
                                          logoDoc = doc;
                                        });
                                        if (!context.mounted) return;
                                        context
                                            .read<CreateSchoolBloc>()
                                            .add(UploadLogo(logoDoc!.path));
                                      }
                                    },
                                    child: _renderUploadBtn(),
                                  ),
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
                                  if (registrationDoc != null)
                                    SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Image.file(
                                        registrationDoc!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  GestureDetector(
                                    onTap: () async {
                                      final doc2 = await pickFile();
                                      if (doc2 != null) {
                                        setState(() {
                                          registrationDoc = doc2;
                                        });
                                        if (!context.mounted) return;
                                        context.read<CreateSchoolBloc>().add(
                                              UploadRegistration(
                                                documentType: context
                                                    .read<MetadataCubit>()
                                                    .state
                                                    .documentTypes![2],
                                                file: registrationDoc!.path,
                                              ),
                                            );
                                      }
                                    },
                                    child: _renderUploadBtn(),
                                  ),
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
                                if (logoDoc != null)
                                  SizedBox(
                                    width: 100,
                                    height: 100,
                                    child:
                                        Image.file(logoDoc!, fit: BoxFit.cover),
                                  ),
                                GestureDetector(
                                  onTap: () async {
                                    final doc = await pickFile();
                                    if (doc != null) {
                                      setState(() {
                                        logoDoc = doc;
                                      });
                                      if (!context.mounted) return;
                                      context
                                          .read<CreateSchoolBloc>()
                                          .add(UploadLogo(logoDoc!.path));
                                    }
                                  },
                                  child: _renderUploadBtn(),
                                ),
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
                                if (registrationDoc != null)
                                  SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Image.file(
                                      registrationDoc!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                GestureDetector(
                                  onTap: () async {
                                    final doc2 = await pickFile();
                                    if (doc2 != null) {
                                      setState(() {
                                        registrationDoc = doc2;
                                      });
                                      if (!context.mounted) return;
                                      context.read<CreateSchoolBloc>().add(
                                            UploadRegistration(
                                              documentType: context
                                                  .read<MetadataCubit>()
                                                  .state
                                                  .documentTypes![2],
                                              file: registrationDoc!.path,
                                            ),
                                          );
                                    }
                                  },
                                  child: _renderUploadBtn(),
                                ),
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
            BlocConsumer<SchoolBloc, SchoolState>(
              listener: (context, state) {
                if (state is SchoolLoaded) {
                  context.read<StaffBloc>().add(GetStaffByEmail(
                      email: context
                          .read<CreateAccountBloc>()
                          .state
                          .staffData!['profile']['email'] as String,),);
                  lc<NavigationService>()
                      .navigateTo(rootNavKey, AppRouter.appHome);
                }
                if (state is SchoolError) {
                  errorSnackbar(context, error: state.error);
                }
              },
              builder: (context, state) {
                if (state is SchoolLoading) {
                  return kLoadingWidget(context, color: Colors.red);
                } else {
                  final createSchoolState =
                      context.read<CreateSchoolBloc>().state;
                  return PrimaryBtn(
                    text: 'Create',
                    ontap: () {
                      final staff =
                          context.read<CreateAccountBloc>().state.staffData;
                      if (_formKey.currentState!.validate() && staff != null) {
                        if (createSchoolState.logo == null) {
                          errorSnackbar(context, error: 'Upload Company logo');
                        } else if (createSchoolState.companyRegistration ==
                            null) {
                          errorSnackbar(
                            context,
                            error: 'Upload Company registration document',
                          );
                        } else {
                          final payload = {
                            'schoolName': nameController.text,
                            'address': addressController.text,
                            'city': cityController.text,
                            'phoneNo': phoneController.text,
                            'description': descriptionController.text,
                            'languageId': 1,
                            'logoKey': createSchoolState.logo!.key,
                            'registrationDocumentKey':
                                createSchoolState.companyRegistration!.file.key,
                            'staff': staff,
                          };
                          print(payload);
                          print(context
                              .read<CreateAccountBloc>()
                              .state
                              .staffData!['profile']['email'],);
                          context
                              .read<SchoolBloc>()
                              .add(CreateSchool(payload: payload));
                        }
                      } else {
                        errorSnackbar(context,
                            error: 'Correct the errors to proceed',);
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

  Widget suggestedAddress() {
    return BlocBuilder<CreateSchoolBloc, CreateSchoolState>(
      builder: (context, state) {
        if (state.suggestedLocations == null ||
            state.suggestedLocations!.isEmpty) {
          return const SizedBox();
        } else if (!suggestingAddress) {
          return const SizedBox();
        } else {
          return Container(
            constraints: const BoxConstraints(maxHeight: 200),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: state.suggestedLocations!.length > 5
                  ? 5
                  : state.suggestedLocations!.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  state.suggestedLocations![index].street,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(state.suggestedLocations![index].locality),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Postcode'),
                    Text(state.suggestedLocations![index].postcode),
                  ],
                ),
                onTap: () {
                  setState(() {
                    addressController.text =
                        state.suggestedLocations![index].street;
                    cityController.text =
                        state.suggestedLocations![index].locality;
                    suggestingAddress = false;
                  });
                },
              ),
            ),
          );
        }
      },
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
    String? icon,
    double iconSize = 24,
    TextInputType inputType = TextInputType.text,
    Widget? suffixIcon,
    bool isMultiline = false,
    void Function(String)? onChanged,
    void Function()? onEditingComplete,
    void Function(bool)? onFocusChange,
  }) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Focus(
        onFocusChange: onFocusChange,
        child: TextFormField(
          controller: ctrl,
          validator: validator,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          keyboardType: inputType,
          minLines: isMultiline ? 4 : 1,
          maxLines: isMultiline ? 8 : 1,
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
            prefixIcon: icon == null
                ? const SizedBox()
                : SizedBox(
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
      ),
    );
  }

  Future<File?> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
      type: FileType.custom,
    );
    try {
      if (result != null) {
        final file = File(result.files.single.path!);
        return file;
      } else {
        // User canceled the picker
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}

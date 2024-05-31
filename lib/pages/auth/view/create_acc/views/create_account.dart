// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/components/secondary_btn.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/locator.dart';
import 'package:korbil_mobile/nav/nav_service.dart';
import 'package:korbil_mobile/nav/router.dart';
import 'package:korbil_mobile/pages/auth/auth.dart';
import 'package:korbil_mobile/pages/auth/bloc/auth/auth_bloc.dart';
import 'package:korbil_mobile/pages/auth/bloc/create_account/create_account_bloc.dart';
import 'package:korbil_mobile/pages/auth/bloc/pending_invite/pending_invite_cubit.dart';
import 'package:korbil_mobile/pages/school/bloc/metadata/metadata_cubit.dart';
import 'package:korbil_mobile/pages/school/bloc/staff/staff_bloc.dart';
import 'package:korbil_mobile/repository/metadata/models/document_type.dart';
import 'package:korbil_mobile/repository/metadata/models/staff_role.dart';
import 'package:korbil_mobile/theme/colors.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';
import 'package:path/path.dart' as path;

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  int selectedStaffRole = 1;
  File? certificateDoc;
  File? licenceDoc;
  String licenseHint = 'Upload Driving License';
  String certificateHint = 'Instructor Certificate';

  Future<bool?> _showCreateDrivingSchoolAlert() {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text('Dialog Title'),
          content: Container(
            padding: const EdgeInsets.all(7),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Image.asset(
                    'assets/imgs/ins/auth/warning_green.png',
                    width: 60,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Create a driving school',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'You are not part of a driving school. do you want to create one?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryBtn(
                  text: 'Create',
                  ontap: () {
                    Navigator.pop(context);
                    lc<NavigationService>()
                        .navigateTo(rootNavKey, AppRouter.createDrivingSchool);
                  },
                  vm: 10,
                  hm: 0,
                ),
                SecondaryBtn(
                  text: 'Discard',
                  ontap: () {
                    Navigator.pop(context, false);
                  },
                  vm: 5,
                  hm: 0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MetadataCubit, MetadataState>(
      listener: (context, state) {
        if (state is MetadataError) {
          errorSnackbar(context, error: state.error);
        }
      },
      builder: (context, metaState) {
        if (metaState is MetadataInitial) {
          context.read<MetadataCubit>().getMetadata();
        }
        if (metaState is! MetadataLoaded) {
          return Material(
            child: kLoadingWidget(context),
          );
        } else {
          final documentTypes = metaState.documentTypes ?? [];
          return SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.white,
              body: MultiBlocListener(
                listeners: [
                  BlocListener<StaffBloc, StaffState>(
                      listener: (context, state) async {
                    if (state is StaffError) {
                      await _noSchoolInviteAlert();
                    }
                  }),
                  BlocListener<PendingInviteCubit, PendingInviteState>(
                      listener: (context, state) {
                    if (state is PendingInviteError) {
                      errorSnackbar(context, error: state.error);
                    }
                  })
                ],
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: Column(
                        children: [
                          if (getPreferedOrientation(context) ==
                              PreferedOrientation.landscape)
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.4,
                              child: Center(
                                child: Image.asset(
                                  'assets/imgs/ins/auth/splash_img.png',
                                  width:
                                      MediaQuery.sizeOf(context).height * 0.4,
                                ),
                              ),
                            )
                          else
                            Container(),
                          if (getPreferedOrientation(context) ==
                              PreferedOrientation.landscape)
                            const SizedBox(height: 15)
                          else
                            Container(),
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
                                        ? 60
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
                              'Create Account',
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
                          'Create Account',
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
                              Row(
                                children: [
                                  Expanded(
                                    child: _renderFormField(
                                      hint: 'First Name',
                                      inputType: TextInputType.name,
                                      ctrl: firstnameController,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return 'Please enter Your First Name';
                                        }
                                        return null;
                                      },
                                      icon:
                                          'assets/imgs/ins/auth/profile_icon.png',
                                    ),
                                  ),
                                  Expanded(
                                    child: _renderFormField(
                                      hint: 'Last Name',
                                      ctrl: lastnameController,
                                      inputType: TextInputType.name,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return 'Please enter Your Last Name';
                                        }
                                        return null;
                                      },
                                      icon:
                                          'assets/imgs/ins/auth/profile_icon.png',
                                    ),
                                  ),
                                ],
                              ),
                              if (getPreferedOrientation(context) ==
                                  PreferedOrientation.landscape)
                                Row(
                                  children: [
                                    Expanded(
                                      child: _renderFormField(
                                        hint: 'Enter your phone no',
                                        ctrl: phoneController,
                                        inputType: TextInputType.phone,
                                        validator: (val) {
                                          if (val == null || val.isEmpty) {
                                            return 'Please enter Your Phone Number';
                                          }
                                          return null;
                                        },
                                        icon:
                                            'assets/imgs/ins/auth/call_green.png',
                                        iconSize: 18,
                                      ),
                                    ),
                                    Expanded(
                                      child: BlocBuilder<CreateAccountBloc,
                                          CreateAccountState>(
                                        buildWhen: (previous, current) =>
                                            previous.email != current.email,
                                        builder: (context, state) {
                                          return _renderFormField(
                                            hint: 'Enter your email',
                                            ctrl: emailController,
                                            inputType:
                                                TextInputType.emailAddress,
                                            onChanged: (email) => context
                                                .read<CreateAccountBloc>()
                                                .add(
                                                    EmailChanged(email: email)),
                                            validator: (val) {
                                              return state.email.displayError !=
                                                      null
                                                  ? 'invalid email'
                                                  : null;
                                            },
                                            icon:
                                                'assets/imgs/ins/auth/email.png',
                                            iconSize: 18,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              else
                                Column(
                                  children: [
                                    _renderFormField(
                                      hint: 'Enter your phone no',
                                      ctrl: phoneController,
                                      inputType: TextInputType.phone,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return 'Please enter Your Phone Number';
                                        }
                                        return null;
                                      },
                                      icon:
                                          'assets/imgs/ins/auth/call_green.png',
                                      iconSize: 18,
                                    ),
                                    BlocBuilder<CreateAccountBloc,
                                        CreateAccountState>(
                                      buildWhen: (previous, current) =>
                                          previous.email != current.email,
                                      builder: (context, state) {
                                        return _renderFormField(
                                          hint: 'Enter your email',
                                          ctrl: emailController,
                                          inputType: TextInputType.emailAddress,
                                          onChanged: (email) => context
                                              .read<CreateAccountBloc>()
                                              .add(EmailChanged(email: email)),
                                          validator: (val) {
                                            return state.email.displayError !=
                                                    null
                                                ? 'invalid email'
                                                : null;
                                          },
                                          icon:
                                              'assets/imgs/ins/auth/email.png',
                                          iconSize: 18,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              if (getPreferedOrientation(context) ==
                                  PreferedOrientation.landscape)
                                Row(
                                  children: [
                                    Expanded(
                                      child: BlocBuilder<CreateAccountBloc,
                                          CreateAccountState>(
                                        buildWhen: (previous, current) =>
                                            previous.password !=
                                            current.password,
                                        builder: (context, state) {
                                          return _renderFormField(
                                            hint: 'Password',
                                            ctrl: passwordController,
                                            onChanged: (password) => context
                                                .read<CreateAccountBloc>()
                                                .add(PasswordChanged(
                                                    password: password)),
                                            errorText: state.password
                                                        .displayError !=
                                                    null
                                                ? 'Uppercase, number, special, upto 8 characters'
                                                : null,
                                            // validator: (val) {
                                            //   return state.isPasswordValid
                                            //       ? null
                                            //       : 'Uppercase, number, Special and upto 8 character';
                                            // },
                                            icon:
                                                'assets/imgs/ins/auth/lock_green.png',
                                            iconSize: 18,
                                            obscure: true,
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: BlocBuilder<CreateAccountBloc,
                                          CreateAccountState>(
                                        buildWhen: (previous, current) =>
                                            previous.password !=
                                                current.password ||
                                            previous.confirmedPassword !=
                                                current.confirmedPassword,
                                        builder: (context, state) {
                                          return _renderFormField(
                                            hint: 'Confirm Password',
                                            onChanged: (password) => context
                                                .read<CreateAccountBloc>()
                                                .add(PasswordConfirm(
                                                    password: password)),
                                            ctrl: confirmPasswordController,
                                            errorText: state.confirmedPassword
                                                        .displayError !=
                                                    null
                                                ? 'passwords do not match'
                                                : null,
                                            // validator: (val) {
                                            //   return state
                                            //           .isConfirmPasswordValid
                                            //       ? null
                                            //       : 'passwords do not match';
                                            // },
                                            icon:
                                                'assets/imgs/ins/auth/lock_green.png',
                                            iconSize: 18,
                                            obscure: true,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              else
                                Column(
                                  children: [
                                    BlocBuilder<CreateAccountBloc,
                                        CreateAccountState>(
                                      buildWhen: (previous, current) =>
                                          previous.password != current.password,
                                      builder: (context, state) {
                                        return _renderFormField(
                                          hint: 'Password',
                                          ctrl: passwordController,
                                          onChanged: (password) => context
                                              .read<CreateAccountBloc>()
                                              .add(PasswordChanged(
                                                  password: password)),
                                          errorText: state
                                                      .password.displayError !=
                                                  null
                                              ? 'Uppercase, number, special, upto 8 characters'
                                              : null,
                                          // validator: (val) {
                                          //   return state.isPasswordValid
                                          //       ? null
                                          //       : 'Uppercase, number, Special and upto 8 character';
                                          // },
                                          icon:
                                              'assets/imgs/ins/auth/lock_green.png',
                                          iconSize: 18,
                                          obscure: true,
                                        );
                                      },
                                    ),
                                    BlocBuilder<CreateAccountBloc,
                                        CreateAccountState>(
                                      buildWhen: (previous, current) =>
                                          previous.password !=
                                              current.password ||
                                          previous.confirmedPassword !=
                                              current.confirmedPassword,
                                      builder: (context, state) {
                                        return _renderFormField(
                                          hint: 'Confirm Password',
                                          ctrl: confirmPasswordController,
                                          onChanged: (password) => context
                                              .read<CreateAccountBloc>()
                                              .add(PasswordConfirm(
                                                  password: password)),
                                          errorText: state.confirmedPassword
                                                      .displayError !=
                                                  null
                                              ? 'passwords do not match'
                                              : null,
                                          // validator: (val) {
                                          //   return state.isConfirmPasswordValid
                                          //       ? null
                                          //       : 'passwords do not match';
                                          // },
                                          icon:
                                              'assets/imgs/ins/auth/lock_green.png',
                                          iconSize: 18,
                                          obscure: true,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              selectUserRole(metaState.staffRoles ?? []),
                              if (getPreferedOrientation(context) ==
                                  PreferedOrientation.landscape)
                                Row(
                                  children: [
                                    Expanded(
                                      child: _renderUploadInputField(
                                        icon: 'assets/imgs/ins/auth/circle.png',
                                        hint: certificateHint,
                                        documentType: documentTypes[0],
                                      ),
                                    ),
                                    Expanded(
                                      child: _renderUploadInputField(
                                        icon:
                                            'assets/imgs/ins/auth/drivers_licence.png',
                                        hint: licenseHint,
                                        documentType: documentTypes[1],
                                      ),
                                    ),
                                  ],
                                )
                              else
                                Column(
                                  children: [
                                    _renderUploadInputField(
                                      icon: 'assets/imgs/ins/auth/circle.png',
                                      hint: certificateHint,
                                      documentType: documentTypes[0],
                                    ),
                                    _renderUploadInputField(
                                      icon:
                                          'assets/imgs/ins/auth/drivers_licence.png',
                                      hint: licenseHint,
                                      documentType: documentTypes[1],
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    if (getPreferedOrientation(context) ==
                        PreferedOrientation.landscape)
                      Row(
                        children: [
                          BlocConsumer<AuthBloc, AuthState>(
                            listener: (context, state) {
                              if (state is AuthError) {
                                errorSnackbar(context, error: state.error);
                              }
                              if (state is AuthLoaded &&
                                  state.status == AuthStatus.authenticated &&
                                  selectedStaffRole < 3) {
                                context.read<StaffBloc>().add(
                                      GetSchoolInvite(
                                        email: emailController.text,
                                      ),
                                    );
                              }
                            },
                            builder: (context, state) {
                              final createAccountState =
                                  context.read<CreateAccountBloc>().state;
                              if (state is AuthLoading) {
                                return kLoadingWidget(context);
                              } else {
                                return PrimaryBtn(
                                  text: 'Sign Up',
                                  ontap: () {
                                    if (_formKey.currentState!.validate()) {
                                      if (createAccountState.certificate ==
                                          null) {
                                        errorSnackbar(
                                          context,
                                          error:
                                              'Upload Instructor Certificate to Continue',
                                        );
                                      } else if (createAccountState.licence ==
                                          null) {
                                        errorSnackbar(
                                          context,
                                          error:
                                              'Upload Driving Licence to Continue',
                                        );
                                      } else {
                                        if (state.status ==
                                            AuthStatus.authenticated) {
                                          context.read<AuthBloc>().add(
                                                UpdateUser(
                                                  email: emailController.text,
                                                  firstname:
                                                      firstnameController.text,
                                                  lastname:
                                                      lastnameController.text,
                                                  // phoneNumber:
                                                  //     phoneController.text,
                                                ),
                                              );
                                        } else {
                                          final accountState = context
                                              .read<CreateAccountBloc>()
                                              .state;
                                          if (accountState.isEmailValid &&
                                              accountState.isPasswordValid &&
                                              accountState
                                                  .isConfirmPasswordValid) {
                                            context.read<AuthBloc>().add(
                                                  SignUp(
                                                    email: emailController.text,
                                                    password:
                                                        passwordController.text,
                                                    firstname:
                                                        firstnameController
                                                            .text,
                                                    lastname:
                                                        lastnameController.text,
                                                    // phoneNumber:
                                                    //     phoneController.text,
                                                  ),
                                                );
                                          }
                                        }
                                        if (selectedStaffRole == 3) {
                                          context.read<CreateAccountBloc>().add(
                                                CreateAccount(
                                                  payload: getPayLoad(
                                                    context
                                                        .read<
                                                            CreateAccountBloc>()
                                                        .state,
                                                  ),
                                                ),
                                              );
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute<dynamic>(
                                              builder: (context) =>
                                                  const CreateDrivingSchoolView(),
                                            ),
                                          );
                                        } else {
                                          // errorSnackbar(context,
                                          //     error:
                                          //         'Only a School Admin Can create school');

                                          context
                                              .read<PendingInviteCubit>()
                                              .getSchoolInvite(
                                                emailController.text,
                                              );
                                        }
                                      }
                                    }
                                  },
                                  hm: 23,
                                  phm: getPreferedOrientation(context) ==
                                          PreferedOrientation.landscape
                                      ? 80
                                      : 0,
                                );
                              }
                            },
                          ),
                          const SizedBox(width: 12),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: 'I have an account?  ',
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: AppColors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Sign In here',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.green,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () =>
                                          lc<NavigationService>().navigateTo(
                                            rootNavKey,
                                            AppRouter.login,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    else
                      Column(
                        children: [
                          BlocConsumer<AuthBloc, AuthState>(
                            listener: (context, state) {
                              if (state is AuthError) {
                                errorSnackbar(context, error: state.error);
                              }
                              if (state is AuthLoaded &&
                                  state.status == AuthStatus.authenticated &&
                                  selectedStaffRole < 3) {
                                context
                                    .read<PendingInviteCubit>()
                                    .getSchoolInvite(emailController.text);
                              }
                            },
                            builder: (context, state) {
                              // final createAccountState =
                              //     context.read<CreateAccountBloc>().state;
                              if (state is AuthLoading) {
                                return kLoadingWidget(context);
                              } else {
                                return BlocBuilder<CreateAccountBloc,
                                    CreateAccountState>(
                                  builder: (context, createAccountState) {
                                    return PrimaryBtn(
                                      text: 'Sign Up',
                                      ontap: () {
                                        if (_formKey.currentState!.validate()) {
                                          if (createAccountState.certificate ==
                                              null) {
                                            errorSnackbar(
                                              context,
                                              error:
                                                  'Upload Instructor Certificate to Continue',
                                            );
                                          } else if (createAccountState
                                                  .licence ==
                                              null) {
                                            errorSnackbar(
                                              context,
                                              error:
                                                  'Upload Driving Licence to Continue',
                                            );
                                          } else {
                                            if (state.status ==
                                                AuthStatus.authenticated) {
                                              context.read<AuthBloc>().add(
                                                    UpdateUser(
                                                      email:
                                                          emailController.text,
                                                      firstname:
                                                          firstnameController
                                                              .text,
                                                      lastname:
                                                          lastnameController
                                                              .text,
                                                      // phoneNumber:
                                                      //     phoneController.text,
                                                    ),
                                                  );
                                            } else {
                                              final accountState = context
                                                  .read<CreateAccountBloc>()
                                                  .state;
                                              if (accountState.isEmailValid &&
                                                  accountState
                                                      .isPasswordValid &&
                                                  accountState
                                                      .isConfirmPasswordValid) {
                                                context.read<AuthBloc>().add(
                                                      SignUp(
                                                        email: emailController
                                                            .text,
                                                        password:
                                                            passwordController
                                                                .text,
                                                        firstname:
                                                            firstnameController
                                                                .text,
                                                        lastname:
                                                            lastnameController
                                                                .text,
                                                        // phoneNumber:
                                                        //     phoneController.text,
                                                      ),
                                                    );
                                              }
                                            }
                                            if (selectedStaffRole == 3) {
                                              context
                                                  .read<CreateAccountBloc>()
                                                  .add(
                                                    CreateAccount(
                                                      payload: getPayLoad(
                                                        context
                                                            .read<
                                                                CreateAccountBloc>()
                                                            .state,
                                                      ),
                                                    ),
                                                  );
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute<dynamic>(
                                                  builder: (context) =>
                                                      const CreateDrivingSchoolView(),
                                                ),
                                              );
                                            } else {
                                              // errorSnackbar(context,
                                              //     error:
                                              //         'Only a School Admin Can create school');

                                              context
                                                  .read<PendingInviteCubit>()
                                                  .getSchoolInvite(
                                                    emailController.text,
                                                  );
                                            }
                                          }
                                        }
                                      },
                                      hm: 23,
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'I have an account?  ',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign In here',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.green,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => lc<NavigationService>()
                                    .navigateTo(rootNavKey, AppRouter.login),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Container _renderUploadInputField({
    required String icon,
    required String hint,
    required DocumentType documentType,
  }) {
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 1),
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.grey1,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 50,
              child: Center(
                child: Image.asset(
                  icon,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            // const SizedBox(
            //   width: 10,
            // ),
            Expanded(
              child: Text(
                hint,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.grey1,
                ),
              ),
            ),
            _renderUploadButton(() async {
              print('document');
              final document = await pickFile();
              print(document);
              if (document != null) {
                if (!mounted) return;
                switch (documentType.value) {
                  case 1:
                    //Instructor Certification
                    context.read<CreateAccountBloc>().add(
                          UploadCertificate(
                            documentType: documentType,
                            file: document.path,
                          ),
                        );
                    setState(() {
                      certificateDoc = document;
                      if (certificateDoc != null) {
                        certificateHint = path.basename(certificateDoc!.path);
                      }
                    });
                  case 2:
                    //Driving License
                    context.read<CreateAccountBloc>().add(
                          UploadLicence(
                            file: document.path,
                            documentType: documentType,
                          ),
                        );
                    setState(() {
                      licenceDoc = document;
                      if (licenceDoc != null) {
                        licenseHint = path.basename(licenceDoc!.path);
                      }
                    });
                  default:
                }
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget _renderUploadButton(void Function()? ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: AppColors.green,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/imgs/ins/auth/upload1.png',
              width: 18,
              height: 12,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Upload',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _renderFormField(
      {required String hint,
      required TextEditingController ctrl,
      required String icon,
      String? Function(String?)? validator,
      // ValidatorFunctionType? validator,
      bool obscure = false,
      double iconSize = 24,
      Widget? suffixIcon,
      String? errorText,
      TextInputType inputType = TextInputType.text,
      void Function(String)? onChanged}) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: TextFormField(
        obscureText: obscure,
        controller: ctrl,
        keyboardType: inputType,
        validator: validator,
        // validator: (val) => validator!(val),
        onChanged: onChanged,
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
          errorText: errorText,
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

  Widget selectUserRole(List<StaffRole> staffRoles) {
    return BlocBuilder<CreateAccountBloc, CreateAccountState>(
      builder: (context, state) {
        final items = List.generate(
          staffRoles.length,
          (index) =>
              {'key': staffRoles[index].name, 'value': staffRoles[index].value},
        );
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButtonFormField<int>(
              value: selectedStaffRole,
              decoration: InputDecoration(
                label: const Text('Select User Type'),
                contentPadding: EdgeInsets.zero,
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
              ),
              items: items.map<DropdownMenuItem<int>>((e) {
                return DropdownMenuItem<int>(
                  value: e['value']! as int,
                  child: Text(e['key']! as String),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedStaffRole = value!;
                });
              },
              hint: const Text('Select User Type'),
              menuMaxHeight: 300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
    );
  }

  Future<File?> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['pdf'],
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

  Map<String, dynamic> getPayLoad(CreateAccountState state) {
    return {
      'profile': {
        'firstName': firstnameController.text,
        'lastName': lastnameController.text,
        'phoneNumber': phoneController.text,
        'email': emailController.text,
        'avatar': 'string',
      },
      'staffData': {
        'documents': [
          {
            'key': state.certificate!.file.key,
            'type': state.certificate!.documentType.value,
          },
          {
            'key': state.licence!.file.key,
            'type': state.licence!.documentType.value,
          }
        ],
        'staffRole': selectedStaffRole,
      },
    };
  }

  Future<bool?> _noSchoolInviteAlert() {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text('Dialog Title'),
          content: const Text('You do not have a pending school invite'),
          actions: [
            SecondaryBtn(
              text: 'Close',
              ontap: () {
                SystemChannels.platform
                    .invokeMethod<void>('SystemNavigator.pop', true);
              },
              vm: 3,
              hm: 0,
            ),
          ],
          actionsAlignment: MainAxisAlignment.center,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        );
      },
    );
  }
}

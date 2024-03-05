// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/components/secondary_btn.dart';
import 'package:korbil_mobile/locator.dart';
import 'package:korbil_mobile/nav/nav_service.dart';
import 'package:korbil_mobile/nav/router.dart';
import 'package:korbil_mobile/pages/auth/auth.dart';
import 'package:korbil_mobile/pages/auth/view/login/login.dart';
import 'package:korbil_mobile/theme/colors.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  Future<void> _showCreateDrivingSchoolAlert() {
    return showDialog<void>(
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
                    Navigator.pop(context);
                  },
                  vm: 5,
                  hm: 0,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final s = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: ListView(
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
                          width: MediaQuery.sizeOf(context).height * 0.4,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _renderFormField(
                              hint: 'First Name',
                              ctrl: TextEditingController(),
                              validator: (val) {
                                return null;
                              },
                              icon: 'assets/imgs/ins/auth/profile_icon.png',
                            ),
                          ),
                          Expanded(
                            child: _renderFormField(
                              hint: 'Last Name',
                              ctrl: TextEditingController(),
                              validator: (val) {
                                return null;
                              },
                              icon: 'assets/imgs/ins/auth/profile_icon.png',
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
                                ctrl: TextEditingController(),
                                validator: (val) {
                                  return null;
                                },
                                icon: 'assets/imgs/ins/auth/call_green.png',
                                iconSize: 18,
                              ),
                            ),
                            Expanded(
                              child: _renderFormField(
                                hint: 'Enter your email',
                                ctrl: TextEditingController(),
                                validator: (val) {
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
                              hint: 'Enter your phone no',
                              ctrl: TextEditingController(),
                              validator: (val) {
                                return null;
                              },
                              icon: 'assets/imgs/ins/auth/call_green.png',
                              iconSize: 18,
                            ),
                            _renderFormField(
                              hint: 'Enter your email',
                              ctrl: TextEditingController(),
                              validator: (val) {
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
                          children: [
                            Expanded(
                              child: _renderFormField(
                                hint: 'Password',
                                ctrl: TextEditingController(),
                                validator: (val) {
                                  return null;
                                },
                                icon: 'assets/imgs/ins/auth/lock_green.png',
                                iconSize: 18,
                                obscure: true,
                              ),
                            ),
                            Expanded(
                              child: _renderFormField(
                                hint: 'Confirm Password',
                                ctrl: TextEditingController(),
                                validator: (val) {
                                  return null;
                                },
                                icon: 'assets/imgs/ins/auth/lock_green.png',
                                iconSize: 18,
                                obscure: true,
                              ),
                            ),
                          ],
                        )
                      else
                        Column(
                          children: [
                            _renderFormField(
                              hint: 'Password',
                              ctrl: TextEditingController(),
                              validator: (val) {
                                return null;
                              },
                              icon: 'assets/imgs/ins/auth/lock_green.png',
                              iconSize: 18,
                              obscure: true,
                            ),
                            _renderFormField(
                              hint: 'Confirm Password',
                              ctrl: TextEditingController(),
                              validator: (val) {
                                return null;
                              },
                              icon: 'assets/imgs/ins/auth/lock_green.png',
                              iconSize: 18,
                              obscure: true,
                            ),
                          ],
                        ),
                      if (getPreferedOrientation(context) ==
                          PreferedOrientation.landscape)
                        Row(
                          children: [
                            Expanded(
                              child: _renderUploadInputField(
                                'assets/imgs/ins/auth/circle.png',
                                'Instructor Certification',
                              ),
                            ),
                            Expanded(
                              child: _renderUploadInputField(
                                'assets/imgs/ins/auth/drivers_licence.png',
                                'Upload Driving license',
                              ),
                            ),
                          ],
                        )
                      else
                        Column(
                          children: [
                            _renderUploadInputField(
                              'assets/imgs/ins/auth/circle.png',
                              'Instructor Certification',
                            ),
                            _renderUploadInputField(
                              'assets/imgs/ins/auth/drivers_licence.png',
                              'Upload Driving license',
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
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (cxt) => const CreateAccountView(),
                      ),
                    ),
                    child: PrimaryBtn(
                      text: 'Sign Up',
                      ontap: _showCreateDrivingSchoolAlert,
                      hm: 23,
                      phm: getPreferedOrientation(context) ==
                              PreferedOrientation.landscape
                          ? 80
                          : 0,
                    ),
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
                              ..onTap = () => lc<NavigationService>()
                                  .navigateTo(rootNavKey, AppRouter.login),
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
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (cxt) => const CreateAccountView(),
                      ),
                    ),
                    child: PrimaryBtn(
                      text: 'Sign Up',
                      ontap: _showCreateDrivingSchoolAlert,
                      hm: 23,
                    ),
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
                ],
              ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Container _renderUploadInputField(String icon, String hint) {
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
            _renderUploadButton(() {}),
          ],
        ),
      ),
    );
  }

  Widget _renderUploadButton(Function ontap) {
    return GestureDetector(
      onTap: () {
        // ignore: avoid_dynamic_calls
        ontap();
      },
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
            const Text('Upload',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                )),
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
    bool obscure = false,
    double iconSize = 24,
    Widget? suffixIcon,
  }) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: TextFormField(
        obscureText: obscure,
        controller: ctrl,
        validator: (val) => validator(val),
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
}

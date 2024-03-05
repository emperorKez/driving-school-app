import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/locator.dart';
import 'package:korbil_mobile/nav/nav_service.dart';
import 'package:korbil_mobile/nav/router.dart';
import 'package:korbil_mobile/pages/auth/auth.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class CreateDrivingSchoolView extends StatefulWidget {
  const CreateDrivingSchoolView({super.key});

  @override
  State<CreateDrivingSchoolView> createState() =>
      _CreateDrivingSchoolViewState();
}

class _CreateDrivingSchoolViewState extends State<CreateDrivingSchoolView> {
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
                                hint: 'Enter your phone no',
                                ctrl: TextEditingController(),
                                validator: (val) {
                                  return null;
                                },
                                icon: 'assets/imgs/ins/auth/school.png',
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
                              icon: 'assets/imgs/ins/auth/school.png',
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, top: 12),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Upload Company Logo',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            fontSize: getPreferedOrientation(
                                                        context) ==
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
                                  _renderUploadBtn(),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, top: 12),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Upload Company Registration Document',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                              fontSize: getPreferedOrientation(
                                                          context) ==
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
                                  _renderUploadBtn(),
                                ],
                              ),
                            )
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
                                _renderUploadBtn(),
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
                                _renderUploadBtn(),
                              ],
                            )
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
            PrimaryBtn(
              text: 'Create',
              ontap: () {
                lc<NavigationService>()
                    .navigateTo(rootNavKey, AppRouter.appHome);
              },
              hm: 23,
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
            const Text('Upload',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: AppColors.green,
                  fontSize: 14,
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
    double iconSize = 24,
    Widget? suffixIcon,
  }) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: TextFormField(
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

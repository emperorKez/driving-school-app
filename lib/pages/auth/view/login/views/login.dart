// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/custom_screen_padding.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/components/secondary_btn.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/pages/app_home/app_home.dart';
import 'package:korbil_mobile/pages/auth/auth.dart';
import 'package:korbil_mobile/pages/auth/bloc/auth/auth_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/staff/staff_bloc.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

typedef ValidatorFunctionType = String? Function(String? val);

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

// Cred getCred() async{
//   return await AuthRepo().getSavedLoginData();
// }
  // @override
  // Future<void> initState() async {
  //   super.initState();
  //   final authState = context.read<AuthBloc>().state;
  //   // if (authState.status == AuthStatus.authenticated && cred != null) {
      
  //   //   context.read<StaffBloc>().add(GetStaffByEmail(email: cred.email));
  //   // }
  // }

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
                    Navigator.push(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (cxt) => const CreateDrivingSchoolView(),
                      ),
                    );
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool _remember = false;

  @override
  Widget build(BuildContext context) {
    // final s = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.white,
      body: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(listener: (context, state) {
            if (state.status == AuthStatus.authenticated) {
              context
                  .read<StaffBloc>()
                  .add(GetStaffByEmail(email: emailController.text));
            }
          },),
          BlocListener<StaffBloc, StaffState>(
            listener: (context, state) {
              if (state is StaffError) {
                Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                    MaterialPageRoute<dynamic>(
                        builder: (context) => const CreateAccountView(),),
                    (route) => false,);
              }
              if (state is StaffLoaded) {
                if (state.staff != null) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (_) => const AppHomePage(),
                    ),
                  );
                } else if (state.staff!.staffData.schoolId == 0) {
                  _showCreateDrivingSchoolAlert();
                } else {
                  Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                      MaterialPageRoute<dynamic>(
                          builder: (context) => const CreateAccountView(),),
                      (route) => false,);
                }
              }
            },
          ),
        ],
        child: _renderMobileBody(context),
      ),
    ),);
  }

  Widget _renderMobileBody(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 100),
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
                const SizedBox(height: 20)
              else
                Container(),
              const Text(
                'Hello Welcome!',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: AppColors.green,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: const Text(
                  'Enter your credentials to access your account.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  _renderFormField(
                    hint: 'Enter your email',
                    inputType: TextInputType.emailAddress,
                    ctrl: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your email';
                      }
                      return null;
                    },
                    icon: 'assets/imgs/ins/auth/email.png',
                    iconSize: 18,
                  ),
                  _renderFormField(
                    hint: 'Password',
                    ctrl: passwordController,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.characters.length < 6) {
                        return 'Password must be more than 6 characters';
                      }
                      return null;
                    },
                    icon: 'assets/imgs/ins/auth/lock_green.png',
                    iconSize: 18,
                    obscure: true,
                  ),
                ],
              ),
            ),
          ),
        ),
        BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthError) {
              errorSnackbar(context, error: state.error);
            }
          },
          builder: (context, state) {
            return state is AuthLoading
                ? kLoadingWidget(context)
                : PrimaryBtn(
                    text: 'Login',
                    ontap: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              SignIn(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                      }
                      print(state.status);
                      // if (state.status == AuthStatus.authenticated) {
                      //   context
                      //       .read<StaffBloc>()
                      //       .add(GetStaffByEmail(email: emailController.text));
                      // }
                    },
                    hm: 23,
                  );
          },
        ),
        CustomScreenPadding(
          child: Row(
            children: [
              Checkbox(
                value: _remember,
                onChanged: (val) {
                  setState(() {
                    _remember = val!;
                  });
                },
                activeColor: AppColors.green,
              ),
              const Text(
                'Remember me',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.black,
                ),
              ),
              const Spacer(),
              const Text(
                'Reset Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.green,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        CustomScreenPadding(
          child: Row(
            children: [
              const Text(
                "Don't have an Account?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () => Navigator.of(context, rootNavigator: true)
                    .pushAndRemoveUntil(
                        MaterialPageRoute<dynamic>(
                            builder: (context) => const CreateAccountView(),),
                        (route) => false,),
                child: const Text(
                  'Register',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height:
              getPreferedOrientation(context) == PreferedOrientation.landscape
                  ? 50
                  : 150,
        ),
        // BlocBuilder<AuthBloc, AuthState>(
        //   builder: (context, state) {
        //     return state is AuthLoading
        //         ? kLoadingWidget(context)
        //         : PrimaryBtn(
        //             text: 'Sign In',
        //             ontap: () {
        //               if (_formKey.currentState!.validate()) {
        //                 context.read<AuthBloc>().add(SignIn(
        //                     email: emailController.text,
        //                     password: passwordController.text,),);
        //               }
        //               if (state.status == AuthStatus.authenticated) {
        //                 context
        //                     .read<StaffBloc>()
        //                     .add(GetStaffByEmail(email: emailController.text));
        //               }
        //             },
        //             hm: 23,
        //           );
        //   },
        // ),
      ],
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
            Text(
              hint,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColors.grey1,
              ),
            ),
            const Spacer(),
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

  Container _renderFormField({
    required String hint,
    required TextEditingController ctrl,
    required ValidatorFunctionType validator,
    required String icon,
    TextInputType inputType = TextInputType.text,
    bool obscure = false,
    double iconSize = 24,
    Widget? suffixIcon,
  }) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: TextFormField(
        obscureText: obscure,
        controller: ctrl,
        keyboardType: inputType,
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

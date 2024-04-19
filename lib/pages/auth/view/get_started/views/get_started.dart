import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/components/snackBar/error_snackbar.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/locator.dart';
import 'package:korbil_mobile/nav/nav_service.dart';
import 'package:korbil_mobile/nav/router.dart';
import 'package:korbil_mobile/pages/app_home/views/app_home.dart';
import 'package:korbil_mobile/pages/auth/bloc/auth/auth_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/metadata/metadata_cubit.dart';
import 'package:korbil_mobile/pages/school/bloc/staff/staff_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({super.key});

  @override
  State<GetStartedView> createState() => _SplashState();
}

class _SplashState extends State<GetStartedView> {
  bool isFirstRun = true;
  SharedPreferences? prefs;

  Future<void> checkFirstRun() async {
    try {
      prefs = await SharedPreferences.getInstance();
      isFirstRun = prefs!.getBool('isFirstRun') ?? true;
    } catch (_) {
      isFirstRun = true;
    }
  }

  @override
  void initState() {
    checkFirstRun();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: MultiBlocListener(
          listeners: [
            BlocListener<MetadataCubit, MetadataState>(
                listener: (context, state) {
              if (state is MetadataError) {
                errorSnackbar(context, error: state.error);
              }
            },),
            BlocListener<AuthBloc, AuthState>(listener: (context, state) async {
              if (state.status == AuthStatus.authenticated) {
                final prefs = await SharedPreferences.getInstance();
                if (!context.mounted) return;
                context
                    .read<StaffBloc>()
                    .add(GetStaffByEmail(email: prefs.getString('email')!));
              }
            },),
            BlocListener<StaffBloc, StaffState>(listener: (context, state) {
              print(state);

              if (state is StaffLoaded) {
                // lc<NavigationService>()
                //             .navigateTo(rootNavKey, AppRouter.appHome);
                            
                Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (_) => const AppHomePage(),
                  ),
                );
              }
            },),
          ],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Spacer(),
              SizedBox(
                height: s.height * 0.1,
                child: Center(
                  child: Image.asset(
                    'assets/imgs/ins/auth/logo.png',
                    width: s.height * 0.8,
                  ),
                ),
              ),
              const Spacer(),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: s.width * 0.9,
                    child: Center(
                      child: Image.asset(
                        'assets/imgs/ins/auth/splash_img.png',
                        width: s.height * 0.8,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: s.width * 0.8,
                    child: Center(
                      child: Image.asset(
                        'assets/imgs/ins/auth/splash_text.png',
                        width: s.height * 0.8,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is! AuthLoaded) {
                    return kLoadingWidget(context);
                  } else {
                    return PrimaryBtn(
                      text: !isFirstRun ? 'Continue' : 'Get Started',
                      ontap: () {
                        prefs!.setBool('isFirstRun', false);
                        lc<NavigationService>()
                            .navigateTo(rootNavKey, AppRouter.login);
                      },
                    );
                  }
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

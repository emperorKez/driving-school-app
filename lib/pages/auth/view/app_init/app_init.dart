import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/locator.dart';
import 'package:korbil_mobile/nav/nav_service.dart';
import 'package:korbil_mobile/nav/router.dart';
import 'package:korbil_mobile/pages/app_home/views/app_home.dart';
import 'package:korbil_mobile/pages/auth/auth.dart';
import 'package:korbil_mobile/pages/auth/bloc/auth/auth_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/staff/staff_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppInit extends StatefulWidget {
  const AppInit({super.key});

  @override
  State<AppInit> createState() => _AppInitState();
}

class _AppInitState extends State<AppInit> {
  bool isFirstRun = false;
  SharedPreferences? prefs;

  Future<void> checkFirstRun() async {
    try {
      prefs = await SharedPreferences.getInstance();
      isFirstRun = prefs!.getBool('isFirstRun') ?? false;
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
    return Scaffold(
      body: !isFirstRun ? appInitBody() : const GetStartedView(),
    );
  }

  Widget appInitBody() {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) async {
            if (state is AuthLoaded &&
                state.status == AuthStatus.authenticated) {
              final prefs = await SharedPreferences.getInstance();
              if (!context.mounted) return;
              context
                  .read<StaffBloc>()
                  .add(GetStaffByEmail(email: prefs.getString('email')!));
            }
            if (state is AuthLoaded &&
                state.status == AuthStatus.unauthenticated) {
              await lc<NavigationService>()
                  .navigateTo(rootNavKey, AppRouter.login);
            }
            // else{
            //    await lc<NavigationService>()
            //               .navigateTo(rootNavKey, AppRouter.login);
            // }
          },
        ),
        BlocListener<StaffBloc, StaffState>(
          listener: (context, state) {
            if (state is StaffLoaded) {
              Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (_) => const AppHomePage(),
                ),
              );
            }
             if (state is StaffError) {
                Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                    MaterialPageRoute<dynamic>(
                        builder: (context) => const CreateAccountView(),),
                    (route) => false,);
              }
          },
        ),
      ],
      child: Center(
        child: kLoadingWidget(context),
      ),
    );
  }
}

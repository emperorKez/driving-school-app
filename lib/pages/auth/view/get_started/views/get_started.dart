import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/locator.dart';
import 'package:korbil_mobile/nav/nav_service.dart';
import 'package:korbil_mobile/nav/router.dart';
import 'package:korbil_mobile/pages/auth/view/create_acc/views/create_acc.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({super.key});

  @override
  State<GetStartedView> createState() => _SplashState();
}

class _SplashState extends State<GetStartedView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
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
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (cxt) => const CreateAccountView(),
                ),
              ),
              child: PrimaryBtn(
                text: 'Get Started',
                ontap: () {
                  lc<NavigationService>()
                      .navigateTo(rootNavKey, AppRouter.createAcc);
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

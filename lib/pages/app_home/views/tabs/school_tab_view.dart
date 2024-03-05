import 'package:flutter/material.dart';
import 'package:korbil_mobile/nav/router.dart';

class SchoolTabView extends StatelessWidget {
  const SchoolTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: AppRouter.schoolSettings,
      key: schoolNavKey,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}

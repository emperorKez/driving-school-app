import 'package:flutter/material.dart';
import 'package:korbil_mobile/nav/router.dart';

class NotificationTabView extends StatelessWidget {
  const NotificationTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: AppRouter.notifications,
      key: notificationsNavKey,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}

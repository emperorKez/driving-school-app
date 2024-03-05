import 'package:flutter/material.dart';
import 'package:korbil_mobile/nav/router.dart';

class LessonTabView extends StatelessWidget {
  const LessonTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: AppRouter.lessonHome,
      key: lessonsNavKey,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}

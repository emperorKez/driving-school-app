import 'package:flutter/material.dart';
import 'package:korbil_mobile/nav/router.dart';

class StudentTabView extends StatelessWidget {
  const StudentTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: AppRouter.studentList,
      key: studentsNavKey,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}

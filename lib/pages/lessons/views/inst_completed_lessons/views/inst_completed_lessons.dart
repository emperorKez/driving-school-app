import 'package:flutter/material.dart';
import 'package:korbil_mobile/global/constants/colors.dart';

class InstCompletedLessons extends StatefulWidget {
  const InstCompletedLessons({super.key});

  @override
  State<InstCompletedLessons> createState() => _InstCompletedLessonsState();
}

class _InstCompletedLessonsState extends State<InstCompletedLessons> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: ListView(),
      ),
    );
  }
}

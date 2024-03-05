import 'package:flutter/material.dart';
import 'package:korbil_mobile/theme/theme.dart';

class InstBookedLessons extends StatefulWidget {
  const InstBookedLessons({super.key});

  @override
  State<InstBookedLessons> createState() => _InstBookedLessonsState();
}

class _InstBookedLessonsState extends State<InstBookedLessons> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: KorbilTheme.of(context).primaryBg,
        body: ListView(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'student_card.dart';

class MyStudentsList extends StatelessWidget {
  const MyStudentsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StudentCard(
          name: 'Isaiah Richardson',
          package: 'Packege 2',
          completedLessons: '5',
        ),
        StudentCard(
          name: 'Mikael Anders',
          package: '10 Hours Packege',
          completedLessons: '12',
        ),
        StudentCard(
          name: 'Mikael Anders',
          package: '10 Hours Packege',
          completedLessons: '12',
        ),
        StudentCard(
          name: 'Mikael Anders',
          package: '10 Hours Packege',
          completedLessons: '12',
        ),
      ],
    );
  }
}

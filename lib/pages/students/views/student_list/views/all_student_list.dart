import 'package:flutter/material.dart';

import 'package:korbil_mobile/pages/students/views/student_list/views/student_card.dart';

class AllStudentsList extends StatelessWidget {
  const AllStudentsList({
    this.onApprove,
    super.key,
  });
  final Function? onApprove;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StudentCard(
          name: 'Mikael Anders',
          package: '10 Hours Packege',
          completedLessons: '12',
          approved: false,
          onApprove: onApprove,
        ),
        const StudentCard(
          name: 'Isaiah Richardson',
          package: 'Packege 2',
          completedLessons: '5',
        ),
        const StudentCard(
          name: 'Mikael Anders',
          package: '10 Hours Packege',
          completedLessons: '12',
        ),
        const StudentCard(
          name: 'Mikael Anders',
          package: '10 Hours Packege',
          completedLessons: '12',
        ),
        const StudentCard(
          name: 'Mikael Anders',
          package: '10 Hours Packege',
          completedLessons: '12',
        ),
      ],
    );
  }
}

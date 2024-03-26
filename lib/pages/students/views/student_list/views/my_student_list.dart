import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/pages/students/bloc/student/student_bloc.dart';

import 'package:korbil_mobile/pages/students/views/student_list/views/student_card.dart';

class MyStudentsList extends StatelessWidget {
  const MyStudentsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentBloc, StudentState>(
      builder: (context, state) {
        return state.studentList!.isEmpty
            ? const Center(
                child: Text('No student found'),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                    state.studentList!.length,
                    (index) =>
                        StudentCard(student: state.studentList![index])));
      },
    );
  }
}

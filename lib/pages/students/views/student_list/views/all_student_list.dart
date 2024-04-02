import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/pages/students/bloc/student/student_bloc.dart';

import 'package:korbil_mobile/pages/students/views/student_list/views/student_card.dart';

class AllStudentsList extends StatelessWidget {
  const AllStudentsList({
    this.onApprove,
    super.key,
  });
  final Function? onApprove;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentBloc, StudentState>(
      builder: (context, state) {
        return Material(
            child: state.studentList!.isEmpty
                ? const Center(
                    child: Text('No Student Found'),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        state.studentList!.length,
                        (index) =>
                            StudentCard(student: state.studentList![index]),),
                  ),);
      },
    );
  }
}

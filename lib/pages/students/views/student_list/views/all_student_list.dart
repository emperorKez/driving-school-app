import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
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
    return Material(
      child: BlocBuilder<StudentBloc, StudentState>(
        builder: (context, state) {
          if(state is! StudentLoaded) {return kLoadingWidget(context);} else{ 
            if (state.allStudent!.currentStudents.isEmpty && state.allStudent!.pendingApproval.isEmpty){
      return const Center(
                      child: Text('No Student Found'),
                    );
            }else{return Column(mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                              state.allStudent!.pendingApproval.length,
                              (index) =>
                                  StudentCard(pendingStudents: state.allStudent!.pendingApproval[index]),),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                              state.allStudent!.currentStudents.length,
                              (index) =>
                                  StudentCard(currentStudent: state.allStudent!.currentStudents[index]),),
                        ),
                    ],
                  );}
        }
        } ),
    );
  }
}

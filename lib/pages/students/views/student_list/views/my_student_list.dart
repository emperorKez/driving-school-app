import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/pages/school/bloc/staff/staff_bloc.dart';
import 'package:korbil_mobile/pages/students/bloc/student/student_bloc.dart';
import 'package:korbil_mobile/pages/students/views/student_list/views/student_card.dart';

class MyStudentsList extends StatelessWidget {
  const MyStudentsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StaffBloc, StaffState>(
      builder: (context, state) {
        return state.students == null || state.students!.isEmpty
            ? const Center(
                child: Text('No student Assigned to you'),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  state.students!.length,
                  (index) => BlocBuilder<StudentBloc, StudentState>(
                    builder: (context, studentState) {
                      if (studentState is! StudentLoaded) {
                        return kLoadingWidget(context);
                      } else {
                        final currentStudent = studentState
                                    .allStudent!.currentStudents
                                    .indexWhere((e) =>
                                        e.id == state.students![index].id,) >=
                                0
                            ? studentState.allStudent!.currentStudents[
                                studentState.allStudent!.currentStudents
                                    .indexWhere((e) =>
                                        e.id == state.students![index].id,)]
                            : null;
                        final pendingStudent = studentState
                                    .allStudent!.pendingApproval
                                    .indexWhere((e) =>
                                        e.id == state.students![index].id,) >=
                                0
                            ? studentState.allStudent!.pendingApproval[
                                studentState.allStudent!.currentStudents
                                    .indexWhere((e) =>
                                        e.id == state.students![index].id,)]
                            : null;

                        return StudentCard(
                          pendingStudents: pendingStudent,
                          currentStudent: currentStudent,
                        );
                      }
                    },
                  ),
                ),
              );
      },
    );
  }
}



// class MyStudentCard extends StatelessWidget {
//   const MyStudentCard({
//     required this.student,
//     super.key,
//   });
//   final StaffStudent student;
  

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 5),
//       padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
//       decoration: BoxDecoration(
//         color: KorbilTheme.of(context).white,
//         boxShadow: [defaultBoxShadow()],
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Row(
//         children: [
//           SizedBox(
//             width: 70,
//             child: Center(
//               child: Container(
//                 width: 50,
//                 height: 50,
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   image: DecorationImage(
//                     image: AssetImage('assets/imgs/ins/lessons/avatar1.png'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '${student.firstName} ${student.lastName}',
//                   style: TextStyle(
//                     fontFamily: 'Poppins',
//                     color: KorbilTheme.of(context).secondaryColor,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Image.asset(
//                       'assets/imgs/ins/school/menu2.png',
//                       width: 12,
//                     ),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
              
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


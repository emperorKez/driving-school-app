import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/box_shadow/default_box_shadow.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/repository/school_info/models/invited_student.dart';
import 'package:korbil_mobile/theme/theme.dart';

class InvitedStudentList extends StatelessWidget {
  const InvitedStudentList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SchoolBloc, SchoolState>(
      builder: (context, state) {
        if (state is! SchoolLoaded) {
          return kLoadingWidget(context);
        } else {
          return state.invitedStudents == null || state.invitedStudents!.isEmpty
              ? const Center(
                  child: Text('No invited Student Found!'),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    state.invitedStudents!.length,
                    (index) => _invitedStudentCard(
                      context,
                      student: state.invitedStudents![index],
                    ),
                  ),
                );
        }
      },
    );
  }

  Widget _invitedStudentCard(
    BuildContext context, {
    required InvitedStudent student,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: KorbilTheme.of(context).white,
        boxShadow: [defaultBoxShadow()],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            student.email,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).secondaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              context.read<SchoolBloc>().add(RemoveInvitedStudent(
                  schoolId: int.parse(student.schoolId), email: student.email));
            },
            icon: Image.asset(
              'assets/imgs/ins/school/delete_bin_red.png',
              width: 20,
            ),
          ),
        ],
      ),
    );
  }
}

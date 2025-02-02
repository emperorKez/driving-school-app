import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/components/secondary_btn.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/students/bloc/student/student_bloc.dart';
import 'package:korbil_mobile/repository/student/models/student.dart';
import 'package:korbil_mobile/repository/student/models/student_package.dart';
import 'package:korbil_mobile/theme/theme.dart';

class ApproveUserAlertContent extends StatelessWidget {
  const ApproveUserAlertContent({
    required this.student, required this.studentPackage,
    super.key,
  });
  final Student student;
  final StudentPackage studentPackage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Pending Approval',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: KorbilTheme.of(context).secondaryColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Are you sure you want Approval',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: KorbilTheme.of(context).secondaryColor,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '“${student.profile.firstName} ${student.profile.lastName} ”',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: KorbilTheme.of(context).secondaryColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: SecondaryBtn(
                  text: 'No',
                  borderColor: KorbilTheme.of(context).secondaryColor,
                  textColor: KorbilTheme.of(context).secondaryColor,
                  ontap: () {
                    Navigator.pop(context);
                  },
                  vm: 5,
                  hm: 0,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: PrimaryBtn(
                  text: 'Yes, Approve',
                  ontap: () {
                    context.read<StudentBloc>().add(ApproveStudent(
                        schoolId: context
                            .read<SchoolBloc>()
                            .state.schoolInfo!.id,
                        studentId: student.profile.id, packageId: studentPackage.studentPackageId,),);
                    Navigator.pop(context);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute<dynamic>(
                    //     builder: (cxt) => const CreateDrivingSchoolView(),
                    //   ),
                    // );
                  },
                  vm: 10,
                  hm: 0,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/box_shadow/default_box_shadow.dart';
import 'package:korbil_mobile/components/loading_widget.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/pages/school/bloc/package/package_bloc.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/students/bloc/student/student_bloc.dart';
import 'package:korbil_mobile/pages/students/views/student_profile_approved/views/student_profile_approved.dart';
import 'package:korbil_mobile/pages/students/views/student_profile_unapproved/views/student_profile_unapproved.dart';

import 'package:korbil_mobile/repository/student/models/school_student.dart';
import 'package:korbil_mobile/theme/theme.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({
    this.currentStudent,
    this.pendingStudents,
    // required this.student,
    // required this.isApproved,
    super.key,
  });
  // final SchoolStudent student;
  final PendingApproval? pendingStudents;
  final CurrentStudent? currentStudent;
  // final bool isApproved;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (currentStudent != null) {
          Navigator.push(
            context,
            MaterialPageRoute<dynamic>(
              builder: (cxt) => StudentProfileApproved(
                student: currentStudent!,
              ),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute<dynamic>(
              builder: (cxt) => StudentProfileUnApproved(
                student: pendingStudents!,
              ),
            ),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          color: KorbilTheme.of(context).white,
          boxShadow: [defaultBoxShadow()],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 70,
              child: Center(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/imgs/ins/lessons/avatar1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${pendingStudents?.firstName ?? currentStudent!.firstName} ${pendingStudents?.lastName ?? currentStudent!.lastName}',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/imgs/ins/school/menu2.png',
                        width: 12,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      BlocBuilder<PackageBloc, PackageState>(
                        builder: (context, state) {
                          final studentPackageId =
                              pendingStudents?.studentPackageId ??
                                  currentStudent!.packageIds[0];
                          return state is! PackageLoaded
                              ? kLoadingWidget(context)
                              : Text(
                                  state
                                      .packages![state.packages!.indexWhere(
                                          (e) =>
                                              e.schoolPackage.id ==
                                              studentPackageId)]
                                      .schoolPackage
                                      .title,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color:
                                        KorbilTheme.of(context).secondaryColor,
                                    fontSize: 12,
                                    fontWeight: currentStudent != null
                                        ? FontWeight.w400
                                        : FontWeight.w600,
                                  ),
                                );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  if (pendingStudents != null)
                    const SizedBox()
                  else
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/imgs/ins/school/menu3.png',
                          width: 12,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Completed Lessons',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: KorbilTheme.of(context).secondaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        // if (student.studentPackage == null ||
                        //     student.studentPackage!.pastLessons.isEmpty)
                        Text(
                          'None',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: KorbilTheme.of(context).secondaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                        // else
                        //   Text(
                        //     student.studentPackage == null
                        //         ? ''
                        //         : '${student.studentPackage!.pastLessons.length}',
                        //     style: TextStyle(
                        //       fontFamily: 'Poppins',
                        //       color: KorbilTheme.of(context).secondaryColor,
                        //       fontSize: 12,
                        //       fontWeight: FontWeight.w600,
                        //     ),
                        //   ),
                      ],
                    ),
                ],
              ),
            ),
            if (currentStudent != null)
              Text(
                'Approved',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.italic,
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              )
            else
              PrimaryBtn(
                text: 'Approve',
                fontSize: 12,
                vm: 0,
                hm: 0,
                phm: 12,
                pvm: 10,
                ontap: () {
                  context.read<StudentBloc>().add(
                        ApproveStudent(
                          schoolId:
                              context.read<SchoolBloc>().state.schoolInfo!.id,
                          studentId: pendingStudents!.id,
                          packageId: pendingStudents!.studentPackageId,
                        ),
                      );
                },
              ),
          ],
        ),
      ),
    );
  }
}

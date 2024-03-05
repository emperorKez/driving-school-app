import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/box_shadow/default_box_shadow.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/theme/theme.dart';

import '../../student_profile_approved/views/student_profile_approved.dart';
import '../../student_profile_unapproved/views/student_profile_unapproved.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({
    required this.name,
    required this.package,
    this.completedLessons,
    this.approved = true,
    this.onApprove,
    super.key,
  });
  final String name;
  final String package;
  final String? completedLessons;
  final bool approved;
  final Function? onApprove;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (approved) {
          Navigator.push(
            context,
            MaterialPageRoute<dynamic>(
              builder: (cxt) => const StudentProfileApproved(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute<dynamic>(
              builder: (cxt) => const StudentProfileUnApproved(),
            ),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
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
                    name,
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
                      Text(
                        package,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: KorbilTheme.of(context).secondaryColor,
                          fontSize: 12,
                          fontWeight:
                              approved ? FontWeight.w400 : FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  if (!approved)
                    Container()
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
                        if (completedLessons == null)
                          Container()
                        else
                          Text(
                            completedLessons!,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: KorbilTheme.of(context).secondaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
            if (approved)
              Container()
            else
              PrimaryBtn(
                text: 'Approval',
                fontSize: 12,
                vm: 0,
                hm: 12,
                phm: 12,
                pvm: 10,
                ontap: () {
                  if (onApprove != null) {
                    onApprove!();
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/box_shadow/default_box_shadow.dart';
import 'package:korbil_mobile/repository/staff/model/top_students.dart';
import 'package:korbil_mobile/theme/theme.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({ required this.student,
    super.key, 
  });
  final TopStudent student;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: KorbilTheme.of(context).white,
        boxShadow: [defaultBoxShadow()],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/imgs/ins/lessons/avatar2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mikael Anders',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: KorbilTheme.of(context).secondaryColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/imgs/ins/school/menu2.png',
                    width: 12,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Packege 3',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: KorbilTheme.of(context).secondaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'assets/imgs/ins/school/menu3.png',
                    width: 12,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Completed Lessons 20',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: KorbilTheme.of(context).secondaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

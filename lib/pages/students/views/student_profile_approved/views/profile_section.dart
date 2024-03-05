import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/custom_screen_padding.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/pages/students/views/manage_student_lesson/manage_students.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScreenPadding(
      child: getPreferedOrientation(context) == PreferedOrientation.landscape
          ? _buildLandscape(context)
          : _buildPortrait(context),
    );
  }

  Widget _buildLandscape(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 78,
          height: 78,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/imgs/ins/lessons/avatar2.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Column(
          children: [
            Text(
              'Mikael Anders',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: KorbilTheme.of(context).secondaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '+462139564235',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: KorbilTheme.of(context).secondaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'mikaelanders@gmail.com',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: KorbilTheme.of(context).secondaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryBtn(
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (cxt) => const ManageStudentLesson(),
                      ),
                    );
                  },
                  text: 'Message',
                  fontSize: 14,
                  hm: 0,
                  pvm: 8,
                  phm: 30,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  Row _buildPortrait(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 78,
          height: 78,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/imgs/ins/lessons/avatar2.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mikael Anders',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '+462139564235',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'mikaelanders@gmail.com',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  PrimaryBtn(
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (cxt) => const ManageStudentLesson(),
                        ),
                      );
                    },
                    text: 'Message',
                    fontSize: 14,
                    hm: 0,
                    pvm: 8,
                    phm: 30,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

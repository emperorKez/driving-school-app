import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/custom_screen_padding.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/repository/student/models/student.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    required this.student,
    super.key,
  });
  final Student student;

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
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${student.profile.firstName} ${student.profile.lastName}',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: KorbilTheme.of(context).secondaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              student.profile.phoneNumber,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: KorbilTheme.of(context).secondaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              student.profile.email,
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
                    //todo there is no api to send message to student
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
                '${student.profile.firstName} ${student.profile.lastName}',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                student.profile.phoneNumber,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                student.profile.email,
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
                      //todo no api to send message to student right now
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
        ),
      ],
    );
  }
}

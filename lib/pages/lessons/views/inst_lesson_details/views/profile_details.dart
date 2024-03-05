import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/theme/theme.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/imgs/ins/lessons/avatar2.png'),
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Student',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: KorbilTheme.of(context).secondaryColor,
              ),
            ),
            Text(
              'Mikael Anders',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: KorbilTheme.of(context).secondaryColor,
              ),
            ),
          ],
        ),
        const Spacer(),
        const SizedBox(
          width: 120,
          child: PrimaryBtn(
            text: 'View',
            fontSize: 14,
            pvm: 5,
            vm: 0,
          ),
        )
      ],
    );
  }
}

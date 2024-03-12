import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/box_shadow/default_box_shadow.dart';
import 'package:korbil_mobile/theme/theme.dart';

class InvitedStudentList extends StatelessWidget {
  const InvitedStudentList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _InvitedStudentCard(),
        _InvitedStudentCard(),
        _InvitedStudentCard(),
        _InvitedStudentCard(),
        _InvitedStudentCard(),
        _InvitedStudentCard(),
      ],
    );
  }
}

class _InvitedStudentCard extends StatelessWidget {
  const _InvitedStudentCard();

  @override
  Widget build(BuildContext context) {
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
            'mikaelanders@gmail.com',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).secondaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          Image.asset(
            'assets/imgs/ins/school/delete_bin_red.png',
            width: 20,
          ),
        ],
      ),
    );
  }
}

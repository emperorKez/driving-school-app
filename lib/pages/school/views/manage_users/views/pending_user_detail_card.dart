import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/school_info/models/school_info.dart';
import 'package:korbil_mobile/theme/theme.dart';

class InstPendingUserDetailsCard extends StatelessWidget {
  const InstPendingUserDetailsCard({
    required this.pendingUser,
    super.key,
  });
  final Staff pendingUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1),
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: KorbilTheme.of(context).white,
          boxShadow: [
            BoxShadow(
              color: KorbilTheme.of(context).alternate2,
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1),
            ),
          ],),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${pendingUser.profile.firstName} ${pendingUser.profile.lastName}',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).secondaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete_outline_outlined,
              color: KorbilTheme.of(context).warningColor,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

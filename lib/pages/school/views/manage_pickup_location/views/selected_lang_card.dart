import 'package:flutter/material.dart';
import 'package:korbil_mobile/theme/theme.dart';

class SelectedLangCard extends StatelessWidget {
  const SelectedLangCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: KorbilTheme.of(context).alternate2,
      ),
      child: Row(
        children: [
          Text(
            'English',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: KorbilTheme.of(context).secondaryColor,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/imgs/ins/school/bin_green.png',
              width: 20,
            ),
          ),
        ],
      ),
    );
  }
}

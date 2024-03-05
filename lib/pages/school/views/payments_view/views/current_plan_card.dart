import 'package:flutter/material.dart';
import 'package:korbil_mobile/theme/theme.dart';

class CurrentPlanCard extends StatelessWidget {
  const CurrentPlanCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: KorbilTheme.of(context).primaryColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: KorbilTheme.of(context).primaryColor),
      ),
      child: Text(
        '5 Years plan',
        style: TextStyle(
          fontFamily: 'Poppins',
          color: KorbilTheme.of(context).secondaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

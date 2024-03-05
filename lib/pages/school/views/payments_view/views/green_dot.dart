import 'package:flutter/material.dart';
import 'package:korbil_mobile/theme/theme.dart';

class GreenDot extends StatelessWidget {
  const GreenDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: KorbilTheme.of(context).primaryColor,
      ),
    );
  }
}

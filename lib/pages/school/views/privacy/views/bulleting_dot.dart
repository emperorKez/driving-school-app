import 'package:flutter/material.dart';
import 'package:korbil_mobile/theme/theme.dart';

class BulletingDot extends StatelessWidget {
  const BulletingDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 3,
      height: 3,
      color: KorbilTheme.of(context).secondaryColor,
      margin: const EdgeInsets.only(right: 10),
    );
  }
}

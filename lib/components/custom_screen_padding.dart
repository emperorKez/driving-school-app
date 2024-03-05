import 'package:flutter/material.dart';

class CustomScreenPadding extends StatelessWidget {
  const CustomScreenPadding({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: child,
    );
  }
}

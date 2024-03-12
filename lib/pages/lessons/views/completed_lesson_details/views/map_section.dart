import 'package:flutter/material.dart';

class MapSection extends StatelessWidget {
  const MapSection({
    required this.s, super.key,
  });

  final Size s;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: s.height * 0.35,
      child: ClipRRect(
        child: Image.asset(
          'assets/imgs/ins/lessons/sample_map.png',
          fit: BoxFit.cover,
          width: s.width,
        ),
      ),
    );
  }
}

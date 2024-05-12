import 'package:flutter/material.dart';
import 'package:korbil_mobile/theme/theme.dart';

class TotalLessons extends StatelessWidget {
  const TotalLessons({
    required this.text,
    required this.val,
    this.icon,
    super.key,
  });
  final String text;
  final String? icon;
  final String val;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 150,
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: KorbilTheme.of(context).primaryColor,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: KorbilTheme.of(context).white,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null)
                    Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        icon!,
                        width: 33,
                      ),
                    )
                  else
                    Container(),
                  Text(
                    val,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: KorbilTheme.of(context).white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:korbil_mobile/pages/school/views/payments_view/views/green_dot.dart';
import 'package:korbil_mobile/theme/theme.dart';

class EarningDetails extends StatelessWidget {
  const EarningDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const GreenDot(),
                  Text(
                    'This Month',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).secondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Text(
                r'199$',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 42,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const GreenDot(),
                  Text(
                    'Total Earnings',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).secondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Text(
                r'2000$',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 42,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

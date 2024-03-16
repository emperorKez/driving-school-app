import 'package:flutter/material.dart';
import 'package:korbil_mobile/theme/theme.dart';

class PriceBreakdownSummaryCard extends StatelessWidget {
  const PriceBreakdownSummaryCard({
    required this.price,
    super.key,
  });
  final int price;

  @override
  Widget build(BuildContext context) {
    final fees = (0.01 * price).round(); //1% of price
    final earnings = (0.99 * price).round(); //99% of price

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: KorbilTheme.of(context).alternate2,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Package price ',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '$price\$',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Platform Fee (1%)',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '-$fees\$',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My earning/pck',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '$earnings\$',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

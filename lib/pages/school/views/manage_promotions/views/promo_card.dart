import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repos/school_repo/models/promotion.dart';
import 'package:korbil_mobile/theme/theme.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({
    required this.promo,
    super.key,
  });
  final Promotion promo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: AspectRatio(
        aspectRatio: 334 / 94,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/imgs/ins/school/promo_bg.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( promo.details,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: DottedLine(
                  dashColor: KorbilTheme.of(context).alternate1,
                  dashLength: 8,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Start date: ${promo.startDate}',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: KorbilTheme.of(context).secondaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              'End date: ${promo.endDate}',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: KorbilTheme.of(context).secondaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 3,
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: DottedLine(
                        direction: Axis.vertical,
                        dashColor: KorbilTheme.of(context).alternate1,
                        dashLength: 8,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${promo.offer}%',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: KorbilTheme.of(context).primaryColor,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            ' Off',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: KorbilTheme.of(context).primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

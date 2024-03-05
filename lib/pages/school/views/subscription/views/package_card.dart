import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/box_shadow/default_box_shadow.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/theme/theme.dart';

class PackageCard extends StatelessWidget {
  const PackageCard({
    super.key,
    required this.s,
  });

  final Size s;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: KorbilTheme.of(context).white,
        // border: Border.all(color: AppColors.grey1),
        boxShadow: [
          // BoxShadow(
          //   color: KorbilTheme.of(context).alternate1,
          //   spreadRadius: 1,
          //   blurRadius: 1,
          //   offset: Offset(1, 1),
          // ),
          defaultBoxShadow()
        ],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: LayoutBuilder(
                builder: (cxt, cts) {
                  return Container(
                    width: cts.maxWidth * 0.6,
                    height: 10,
                    decoration: BoxDecoration(
                      color: KorbilTheme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            Text(
              'Tier 1',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: KorbilTheme.of(context).secondaryColor,
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Package',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: KorbilTheme.of(context).secondaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Recommended/Current',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: KorbilTheme.of(context).primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Informations :',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: KorbilTheme.of(context).secondaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: KorbilTheme.of(context).secondaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                r'$1750.00',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const PrimaryBtn(
              text: 'More Details',
              fontSize: 14,
              pvm: 10,
            ),
            const Spacer(),
            Center(
              child: LayoutBuilder(
                builder: (cxt, cts) {
                  return Container(
                    width: cts.maxWidth * 0.6,
                    height: 10,
                    decoration: BoxDecoration(
                      color: KorbilTheme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

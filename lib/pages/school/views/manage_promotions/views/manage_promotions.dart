import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/pages/school/views/add_new_promo/views/add_new_promo.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

import 'no_promo_widget.dart';
import 'promo_card.dart';

class InstManagePromotions extends StatefulWidget {
  const InstManagePromotions({super.key});

  @override
  State<InstManagePromotions> createState() => _InstManagePromotionsState();
}

class _InstManagePromotionsState extends State<InstManagePromotions> {
  bool _hasPromos = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getPreferedOrientation(context) == PreferedOrientation.landscape
          ? null
          : AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text(
                'Promote',
                style: TextStyle(
                  fontFamily: 'Lato',
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              leading: const InstAppBarBackBtn(),
            ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Ongoing promos',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            if (_hasPromos) _buildPromoCards() else const NoPromosWidget(),
            const SizedBox(
              height: 30,
            ),
            PrimaryBtn(
              text: 'Create New Promo',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (cxt) => const InstAddNewPromoView(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Column _buildPromoCards() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PromoCard(),
        PromoCard(),
        PromoCard(),
      ],
    );
  }
}

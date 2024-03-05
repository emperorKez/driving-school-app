import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

import 'current_plan_card.dart';
import 'earning_details.dart';
import 'payment_data_table.dart';

class InstPaymentsView extends StatefulWidget {
  const InstPaymentsView({super.key});

  @override
  State<InstPaymentsView> createState() => _InstPaymentsViewState();
}

class _InstPaymentsViewState extends State<InstPaymentsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getPreferedOrientation(context) == PreferedOrientation.landscape
          ? null
          : AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text(
                'Payments',
                style: TextStyle(
                  fontFamily: 'Lato',
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              leading: const InstAppBarBackBtn(),
            ),
      body: _renderMobileBody(),
    );
  }

  Container _renderMobileBody() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView(
        children: const [
          SizedBox(
            height: 20,
          ),
          EarningDetails(),
          SizedBox(
            height: 15,
          ),
          Text(
            'Current Plan',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CurrentPlanCard(),
          SizedBox(
            height: 15,
          ),
          Text(
            'Payment History',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: PaymentDataTable(),
            ),
          ),
        ],
      ),
    );
  }
}

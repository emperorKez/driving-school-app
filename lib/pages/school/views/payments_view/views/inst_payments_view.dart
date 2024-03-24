import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/pages/school/bloc/school_bloc/school_bloc.dart';
import 'package:korbil_mobile/pages/school/views/payments_view/views/current_plan_card.dart';
import 'package:korbil_mobile/pages/school/views/payments_view/views/earning_details.dart';
import 'package:korbil_mobile/pages/school/views/payments_view/views/payment_data_table.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

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
    final subscriptionLevel =
        context.read<SchoolBloc>().state.schoolInfo!.subscriptionLevel;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          const EarningDetails(),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Current Plan',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CurrentPlanCard(
            subscriptionLevel: subscriptionLevel,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Payment History',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
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

import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/app_bar_back_btn.dart';
import 'package:korbil_mobile/global/constants/colors.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

import 'bulleting_dot.dart';

class InstPrivacyView extends StatefulWidget {
  const InstPrivacyView({super.key});

  @override
  State<InstPrivacyView> createState() => _InstPrivacyViewState();
}

class _InstPrivacyViewState extends State<InstPrivacyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getPreferedOrientation(context) == PreferedOrientation.landscape
          ? null
          : AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text(
                'Privacy',
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
        children: [
          AspectRatio(
            aspectRatio: 334 / 181,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.red,
                image: const DecorationImage(
                  image: AssetImage('assets/imgs/ins/school/privacy_img.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          _bulletingPoint('Privacy Policy'),
          const Text(
            'körbil built the körbil app as [open source/free/freemium/ad-supported/commercial] app. This SERVICE is provided by körbil at no cost and is intended for use as is.',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          _bulletingPoint('Information Collection and Use'),
          _bulletingPoint('Log Data'),
          _bulletingPoint('Cookies'),
          _bulletingPoint('Service Providers'),
          _bulletingPoint('Security'),
          _bulletingPoint('Links to Other Sites'),
          _bulletingPoint('Children’s Privacy'),
          _bulletingPoint('Changes to This Privacy Policy'),
          _bulletingPoint('Contact Us'),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget _bulletingPoint(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          const BulletingDot(),
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'Poppins',
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

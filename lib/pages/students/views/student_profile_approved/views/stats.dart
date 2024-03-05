import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/box_shadow/default_box_shadow.dart';
import 'package:korbil_mobile/components/custom_screen_padding.dart';
import 'package:korbil_mobile/theme/theme.dart';
import 'package:korbil_mobile/utils/prefered_orientation.dart';

class Stats extends StatelessWidget {
  const Stats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScreenPadding(
      child: getPreferedOrientation(context) == PreferedOrientation.landscape
          ? _buildLandscape()
          : _buildPortrait(),
    );
  }

  Widget _buildLandscape() {
    return const Row(
      children: [
        Expanded(
          child: _StatCard(
            icon: 'assets/imgs/ins/profile/pie.png',
            title: 'Total Hours',
            val: '25',
            metrics: 'Hrs',
            other: '5 hours Remaining',
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: _StatCard(
            icon: 'assets/imgs/ins/profile/pie.png',
            title: 'Total Hours',
            val: '25',
            metrics: 'Hrs',
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: _StatCard(
            icon: 'assets/imgs/ins/profile/pie.png',
            title: 'Total Hours',
            val: '25',
            metrics: 'Hrs',
          ),
        ),
      ],
    );
  }

  Row _buildPortrait() {
    return const Row(
      children: [
        Expanded(
          child: _StatCard(
            icon: 'assets/imgs/ins/profile/pie.png',
            title: 'Total Hours',
            val: '25',
            metrics: 'Hrs',
            other: '5 hours Remaining',
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: _StatCard(
            icon: 'assets/imgs/ins/profile/pie.png',
            title: 'Total Hours',
            val: '25',
            metrics: 'Hrs',
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: _StatCard(
            icon: 'assets/imgs/ins/profile/pie.png',
            title: 'Total Hours',
            val: '25',
            metrics: 'Hrs',
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.title,
    required this.metrics,
    required this.val,
    this.other,
    super.key,
  });

  final String icon;
  final String title;
  final String val;
  final String metrics;
  final String? other;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: KorbilTheme.of(context).white,
        boxShadow: [defaultBoxShadow()],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            icon,
            width: 24,
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).secondaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          if (other == null)
            SizedBox(
              height: getPreferedOrientation(context) ==
                      PreferedOrientation.landscape
                  ? 15
                  : 30,
            )
          else
            Container(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '$val ',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    metrics,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: KorbilTheme.of(context).secondaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              if (other != null)
                Text(
                  other!,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: KorbilTheme.of(context).alternate1,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                )
              else
                Container(),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/radio_boxes/primary_square_radio_box.dart';
import 'package:korbil_mobile/theme/theme.dart';

class SelectedBadAssementDetailCard extends StatelessWidget {
  const SelectedBadAssementDetailCard({
    super.key,
    required this.selectedGoodAssesment,
  });

  final String selectedGoodAssesment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: KorbilTheme.of(context).primaryBg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            selectedGoodAssesment,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).secondaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Row(
              children: [
                const PrimarySelectedSwitch(
                  selected: true,
                ),
                Text(
                  'Pulling up on the right',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: KorbilTheme.of(context).secondaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                Image.asset(
                  'assets/imgs/ins/lessons/tasks.png',
                  width: 20,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Row(
              children: [
                const PrimarySelectedSwitch(
                  selected: true,
                ),
                Text(
                  'Reverse parking into a bay',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: KorbilTheme.of(context).secondaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                Image.asset(
                  'assets/imgs/ins/lessons/tasks.png',
                  width: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

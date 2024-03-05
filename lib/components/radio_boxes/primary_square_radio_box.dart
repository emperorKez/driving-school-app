import 'package:flutter/material.dart';
import 'package:korbil_mobile/global/constants/colors.dart';

class PrimarySelectedSwitch extends StatelessWidget {
  const PrimarySelectedSwitch({
    required this.selected,
    super.key,
  });

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(right: 12),
        child: Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              color: AppColors.green,
            ),
          ),
          child: Center(
            child: selected
                ? Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.green,
                    ),
                  )
                : Container(),
          ),
        ),
      ),
    );
  }
}

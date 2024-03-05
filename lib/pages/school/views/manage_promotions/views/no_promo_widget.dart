import 'package:flutter/material.dart';
import 'package:korbil_mobile/theme/theme.dart';

class NoPromosWidget extends StatelessWidget {
  const NoPromosWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Image.asset(
          'assets/imgs/ins/school/promo_img.png',
          width: MediaQuery.of(context).size.width * 0.5,
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'You dont have any ongoing promotions at the moment',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: KorbilTheme.of(context).secondaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/primary_btn.dart';
import 'package:korbil_mobile/components/secondary_btn.dart';
import 'package:korbil_mobile/theme/theme.dart';

class AlertDialogContent extends StatelessWidget {
  const AlertDialogContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.all(7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/imgs/ins/lessons/green_tick.png',
                width: 60,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Confirm?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: KorbilTheme.of(context).secondaryColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'You have enabled a promotion',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: KorbilTheme.of(context).secondaryColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Promotion fee (One time)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: KorbilTheme.of(context).secondaryColor,
              ),
            ),
            Text(
              r'$25.00',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: KorbilTheme.of(context).primaryColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            PrimaryBtn(
              text: 'Pay',
              ontap: () {
                //todo integrate paymant api
                Navigator.pop(context, true);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute<dynamic>(
                //     builder: (cxt) => const InstCompletedLessonDetails(),
                //   ),
                // );
              },
              vm: 10,
              hm: 0,
            ),
            SecondaryBtn(
              text: 'Discard',
              ontap: () {
                Navigator.pop(context, false);
              },
              vm: 5,
              hm: 0,
            ),
          ],
        ),
      ),
    );
  }
}

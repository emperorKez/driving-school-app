import 'package:flutter/material.dart';
import 'package:korbil_mobile/theme/theme.dart';

class InstAppBarBackBtn extends StatelessWidget {
  const InstAppBarBackBtn({
    this.ontap,
    super.key,
  });
  final Function? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (ontap == null) {
          Navigator.pop(context);
        } else {
          ontap!;
        }
      },
      child: Container(
        padding: const EdgeInsets.only(left: 15),
        child: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: KorbilTheme.of(context).secondaryColor,
        ),
      ),
      //replace with our own icon data.
    );
  }
}

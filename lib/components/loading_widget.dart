import 'package:flutter/material.dart';
import 'package:korbil_mobile/theme/theme.dart';

Widget kLoadingWidget(BuildContext context) => Center(
      child: CircularProgressIndicator(
        color: KorbilTheme.of(context).primaryColor,
      ),
    );
import 'package:flutter/material.dart';
import 'package:korbil_mobile/theme/theme.dart';

Widget kLoadingWidget(BuildContext context, {Color? color}) => Center(
      child: CircularProgressIndicator(
        color: color ?? KorbilTheme.of(context).primaryColor,
      ),
    );
    

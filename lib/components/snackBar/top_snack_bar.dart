import 'package:flutter/material.dart';

SnackBar buildTopSnackbar(BuildContext context, String text) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
      bottom: MediaQuery.sizeOf(context).height - 200,
      left: 20,
      right: 20,
    ),
    content: Text(text),
  );
}

import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/snackBar/top_snack_bar.dart';

ScaffoldMessengerState errorSnackbar(
  BuildContext context, {
  required String error,
}) {
  return ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      buildTopSnackbar(context, error)
      // SnackBar(
      //   content: Container(
      //     width: double.infinity,
      //     height: 50,
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(10),
      //       color: Theme.of(context).colorScheme.primaryContainer,
      //     ),
      //     child: Center(child: Text(error)),
      //   ),
      //   backgroundColor: Colors.transparent,
      //   padding: const EdgeInsets.all(10),
      //   showCloseIcon: true,
      //   elevation: 0,
      //   duration: const Duration(seconds: 5),
      // ),
    );
}

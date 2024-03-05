import 'package:flutter/material.dart';

enum PreferedOrientation { potrait, landscape }

PreferedOrientation getPreferedOrientation(BuildContext context) {
  const marginWidth = 600;
  final sWidth = MediaQuery.sizeOf(context).width;
  if (sWidth > marginWidth) return PreferedOrientation.landscape;
  return PreferedOrientation.potrait;
}

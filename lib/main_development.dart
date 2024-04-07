import 'package:flutter/material.dart';
import 'package:korbil_mobile/app.dart';
import 'package:korbil_mobile/bootstrap.dart';
import 'package:korbil_mobile/repository/auth/auth_repo.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthRepo().configureAmplify();
  await bootstrap(() => const App());
}

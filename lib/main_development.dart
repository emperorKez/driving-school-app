import 'package:flutter/material.dart';
import 'package:korbil_mobile/app.dart';
import 'package:korbil_mobile/bootstrap.dart';
import 'package:korbil_mobile/repository/auth/auth_repo.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initAmplify();  
   await bootstrap(() => const App());
  //  runApp();
}
Future<void> initAmplify() async {
    // WidgetsFlutterBinding.ensureInitialized();
    await AuthRepo().configureAmplify();
  }

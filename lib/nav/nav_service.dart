import 'package:flutter/material.dart';

class NavigationService {
  void goBack(
    GlobalKey<NavigatorState> navKey,
  ) {
    navKey.currentState!.pop();
  }

  Future<dynamic> navigateTo(GlobalKey<NavigatorState> navKey, String routeName,
      {dynamic args}) {
    return navKey.currentState!.pushNamed(routeName, arguments: args);
  }

  Future<dynamic> pushReplacementNamed(
      GlobalKey<NavigatorState> navKey, String routeName,
      {dynamic args}) {
    return navKey.currentState!
        .pushReplacementNamed(routeName, arguments: args);
  }

  Future<dynamic> pushAndRemoveUntil(
      GlobalKey<NavigatorState> navKey, String routeName,
      {dynamic args}) {
    return navKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: args);
  }

  void popUntil(GlobalKey<NavigatorState> navKey, String routeName) {
    navKey.currentState!.popUntil(ModalRoute.withName(routeName));
  }
}

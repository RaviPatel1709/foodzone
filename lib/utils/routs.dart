import 'package:flutter/material.dart';
import '../setting/login_scn.dart';
import 'const.dart';
import '../getstarted.dart';

class MyAppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeLoginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case routeHomeScreen:
        return MaterialPageRoute(builder: (_) => const getstarted());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

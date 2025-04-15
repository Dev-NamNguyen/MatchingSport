import 'package:flutter/material.dart';
import 'package:matchingsport/features/authentication/screens/introduction_screen.dart';
import 'package:matchingsport/features/authentication/screens/login_screen.dart';
import 'package:matchingsport/features/authentication/screens/signup_screen.dart';
import 'package:matchingsport/utils/routes/routes_names.dart';
import 'package:matchingsport/features/home_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case (RouteNames.home):
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      case (RouteNames.introductionScreen):
        return MaterialPageRoute(
            builder: (BuildContext context) => const IntroductionScreen());

      case (RouteNames.loginScreen):
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());

      case (RouteNames.signupScreen):
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignupScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("No route is configured"),
            ),
          ),
        );
    }
  }
}

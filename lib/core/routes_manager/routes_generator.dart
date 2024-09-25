import 'package:e_commerce_app/core/routes_manager/routes.dart';
import 'package:e_commerce_app/presentation/home/home_screen.dart';
import 'package:e_commerce_app/presentation/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class RoutesGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.homeTab:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
        defult:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}

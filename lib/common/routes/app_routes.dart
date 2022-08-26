import 'package:ecommerce_app/ui/pages/details/detailed.dart';
import 'package:ecommerce_app/ui/pages/home/home_page.dart';
import 'package:ecommerce_app/ui/pages/my_cart/my_cart.dart';
import 'package:ecommerce_app/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final instance = AppRoutes._();

  AppRoutes._();

  Route<dynamic>? onGenerateRoute(RouteSettings settings, BuildContext context) {
    switch (settings.name) {
      case AppRoutesName.splashScrean:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const SplashPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween = Tween(begin: 0.0, end: 1.0);
            return FadeTransition(opacity: animation.drive(tween), child: child);
          },
          transitionDuration: const Duration(milliseconds: 500),
        );

      case AppRoutesName.home:
        return MaterialPageRoute(builder: (context) {
          return const HomePage();
        });

      case AppRoutesName.detailed:
        return MaterialPageRoute(builder: (context) {
          return const DetailedPage();
        });

      case AppRoutesName.myCart:
        return MaterialPageRoute(builder: (context) => const MyCartPage());
      default:
        return null;
    }
  }
}

abstract class AppRoutesName {
  static const splashScrean = '/';
  static const home = '/home';
  static const detailed = '/home/detailed';
  static const myCart = '/home/my_cart';
}

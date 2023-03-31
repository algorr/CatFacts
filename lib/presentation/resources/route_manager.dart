import 'package:catfacts/presentation/home/home_view.dart';
import 'package:flutter/material.dart';

import '../splash/splash_view.dart';
import 'string_manager.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onBoardingRoute = '/onBoarding';
  static const String homeRoute = '/home';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String mainRoute = '/main';
  static const String storeDetailRoute = '/storeDetail';
}

class RouteManager {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      /*  case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView()); */
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      /*  case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailView()); */
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(
                child: Text(AppStrings.oppsss),
              ),
            ));
  }
}

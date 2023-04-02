import 'package:catfacts/presentation/history/history_view.dart';
import 'package:catfacts/presentation/home/home_view.dart';
import 'package:flutter/material.dart';
import 'string_manager.dart';

class Routes {
  static const String homeRoute = '/home';
  static const String historyRoute = '/history';
}

class RouteManager {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.historyRoute:
        return MaterialPageRoute(builder: (_) => const HistoryView());
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
      ),
    );
  }
}

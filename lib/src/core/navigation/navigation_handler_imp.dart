import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/navigation/navigation_handler.dart';
import 'package:flutter_challenge/src/presentation/modules/airplane/airplane_page.dart';
import 'package:flutter_challenge/src/presentation/modules/battery/battery_page.dart';
import 'package:flutter_challenge/src/presentation/modules/connection/connection_page.dart';
import 'package:flutter_challenge/src/presentation/modules/home/home_page.dart';
import 'package:flutter_challenge/src/presentation/modules/welcome/welcome_page.dart';

class NavigationHandlerImp implements INavigationHandler{

  @override
  GlobalKey<NavigatorState> appGlobalKey = GlobalKey();

  @override
  Route appRoutes(RouteSettings settings) {
    switch(settings.name){
      case HomePage.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return const HomePage();
          },
        );

      case WelcomePage.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return WelcomePage();
          },
        );

      case ConnectionPage.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return ConnectionPage();
          },
        );

      case AirplanePage.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return AirplanePage();
          },
        );

      case BatteryPage.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return BatteryPage();
          },
        );

      default:
        //em caso de rota desconhecida
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return Container();
          },
        );
    }
  }

  @override
  pop<T extends Object?>([T? result]) async {
    return appGlobalKey.currentState?.pop(T);
  }

  @override
  Future<T?> push<T extends Object?>(String route, {Object? arguments}) async {
    return appGlobalKey.currentState?.pushNamed(route,arguments: arguments);
  }


  @override
  BuildContext getContext() {
    return appGlobalKey.currentState!.context;
  }

}
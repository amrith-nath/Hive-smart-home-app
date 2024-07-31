import 'package:flutter/material.dart';
import 'package:hive/config/routes/routes_nname.dart';

import '../../views/views.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return _getRoute(screen: const ScreenSplash());
      case RouteName.login:
        return _getRoute(screen: const ScreenLogin());
      case RouteName.home:
        return _getRoute(screen: const ScreenHome());
      default:
        return _getRoute(screen: _defaultWidget);
    }
  }

//========================================================================>
//
// helper function for reuseability
//
  static Route<dynamic> _getRoute({required Widget screen}) {
    return MaterialPageRoute(builder: (context) => screen);
  }

//
//------------------------------------------------------------->
//
  static Widget get _defaultWidget => const Scaffold(
        body: Center(
          child: Text('No route generated'),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:hive/config/routes/routes_name.dart';
import 'package:hive/views/auth/screen_signup.dart';
import 'package:hive/views/mqtt/screen_mqtt.dart';
import '../../views/views.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return _getRoute(screen: const ScreenSplash());

      case RouteName.home:
        return _getRoute(screen: const ScreenHome());
      case RouteName.onboard:
        return _getRoute(screen: const ScreenOnboard());
      case RouteName.login:
        return _getRoute(screen: const ScreenLogin());
      case RouteName.signUp:
        return _getRoute(screen: const ScreenSignUp());
      case RouteName.mqtt:
        return _getRoute(screen: const ScreenMQTT());
      default:
        return _getRoute(screen: _defaultWidget);
    }
  }

//========================================================================>
//
// helper function to reuse
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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/services/session_controller/session_controller.dart';

import '../../config/config.dart';

class SplashServices {
  //
  void isLogin(BuildContext context) {
    //

    SessionController().getUserDataFromPreference().then((value) {
      if (SessionController().isLogin ?? false) {
        Timer(
          const Duration(seconds: 3),
          () => Navigator.pushNamedAndRemoveUntil(
            context,
            RouteName.home,
            (r) => false,
          ),
        );
      } else {
        Timer(
          const Duration(seconds: 3),
          () => Navigator.pushNamedAndRemoveUntil(
            context,
            RouteName.onboard,
            (r) => false,
          ),
        );
      }
    }).onError((e, s) {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.pushNamedAndRemoveUntil(
          context,
          RouteName.onboard,
          (r) => false,
        ),
      );
    });
  }
}

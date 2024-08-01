import 'dart:async';

import 'package:flutter/material.dart';

import '../../config/config.dart';

class SplashServices {
  //
  void isLogin(BuildContext context) {
    //
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        RouteName.onboard,
        (r) => false,
      ),
    );
  }
}

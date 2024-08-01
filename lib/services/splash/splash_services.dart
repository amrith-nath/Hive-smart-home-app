import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/config/routes/routes_nname.dart';

class SplashServices {
  //
  void isLogin(BuildContext context) {
    //
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        RouteName.login,
        (r) => false,
      ),
    );
  }
}

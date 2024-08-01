import 'package:flutter/material.dart';
import 'package:hive/config/components/internet_exception_widget.dart';

import 'package:hive/services/splash/splash_services.dart';

import '../../config/data/exceptions/app_exceptions.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  final _splashServices = SplashServices();

  @override
  void initState() {
    _splashServices.isLogin(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: InternetExceptionWidget(
        onTap: () {
          throw NoInternetException("Network unavilable");
        },
      )),
    );
  }
}

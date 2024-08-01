import 'package:flutter/material.dart';
import 'package:hive/config/components/internet_exception_widget.dart';
import 'package:hive/config/components/loading_widget.dart';
import 'package:hive/config/routes/routes_nname.dart';

import '../../config/data/exceptions/app_exceptions.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
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

import 'package:flutter/material.dart';
import 'package:hive/config/constants/assets.dart';
import 'package:hive/config/constants/tags.dart';
import 'package:hive/config/extensions/size_extensions.dart';

import 'package:hive/services/splash/splash_services.dart';

import '../../config/colors/colors.dart';

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
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Hero(
            tag: KTags.primaryHeroTag,
            child: Image.asset(
              KAssets.hiveLogo,
              width: 100,
            ),
          ),
          30.vh,
          Text(
            "HIVE",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: KColors.textMain,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                ),
          ),
        ],
      )),
    );
  }
}

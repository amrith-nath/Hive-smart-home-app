import 'package:flutter/material.dart';
import 'package:hive/constants/assets.dart';
import 'package:hive/constants/tags.dart';
import 'package:hive/utils/utils.dart';

import '../../config/colors/colors.dart';
import '../../services/services.dart';

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
            transitionOnUserGestures: true,
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

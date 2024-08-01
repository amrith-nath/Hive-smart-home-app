import 'package:flutter/material.dart';

import '../../config/config.dart';

class ScreenOnboard extends StatefulWidget {
  const ScreenOnboard({super.key});

  @override
  State<ScreenOnboard> createState() => _ScreenOnboardState();
}

class _ScreenOnboardState extends State<ScreenOnboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            70.vh,
            Hero(
              tag: KTags.primaryHeroTag,
              child: Image.asset(KAssets.hiveLogo),
            ),
            30.vh,
            Text(
              "Easily Control\nYour Home",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: KColors.textMain,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              "Manage your home from anytime,\nanywhere.",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 16,
                    color: KColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const Spacer(),
            PrimaryButtonWidget(
                width: double.infinity,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.signUp);
                },
                label: "Create An Account"),
            15.vh,
            PrimaryButtonWidget(
              useStyle2: true,
              width: double.infinity,
              onTap: () {
                Navigator.pushNamed(context, RouteName.login);
              },
              label: "SignIn Now",
            ),
            70.vh,
          ],
        ),
      )),
    );
  }
}

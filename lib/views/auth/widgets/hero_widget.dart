import 'package:flutter/material.dart';
import 'package:hive/utils/utils.dart';
import '../../../config/config.dart';
import '../../../constants/assets.dart';
import '../../../constants/tags.dart';

class AuthHeroWidget extends StatelessWidget {
  const AuthHeroWidget(
      {super.key, required this.heading, required this.subHeading});
  final String heading;
  final String subHeading;
  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
      tag: KTags.primaryHeroTag,
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 230,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: KColors.whiteSecondary,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            image: DecorationImage(
              image: AssetImage(KAssets.loginBG),
              scale: 3,
              fit: BoxFit.fill,
              opacity: 0.8,
            )),
        child: Column(
          // mainAxisSize: MainAxisSize.min,

          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  heading,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: KColors.textMain,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            10.vh,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.login,
                  color: KColors.textSecondary,
                ),

                10.vw,
                Text(
                  subHeading,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 16,
                        color: KColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                // Spacer(),

                // Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/services/session_controller/session_controller.dart';
import 'package:hive/utils/utils.dart';

import '../../../config/config.dart';
import '../../../constants/constants.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: false,
      elevation: 0,
      surfaceTintColor: KColors.whitePrimary,
      shadowColor: KColors.whitePrimary,
      toolbarHeight: 80,
      leadingWidth: 60,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Image.asset(
          KAssets.profille,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "User name",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Text(
            "somemail@example.com",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: KColors.textSecondary),
          ),
        ],
      ),
      actions: [
        InkWell(
          onTap: () async {
            await SessionController().deleteUserPreference().then((_) {
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteName.onboard, (_) => false);
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
                color: KColors.iconBgInactive,
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Logout",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: KColors.darkPrimary),
                ),
                5.vw,
                const Icon(
                  Icons.exit_to_app,
                  color: KColors.darkPrimary,
                ),
              ],
            ),
          ),
        ),
        20.vw,
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}

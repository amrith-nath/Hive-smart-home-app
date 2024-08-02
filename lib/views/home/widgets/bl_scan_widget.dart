import 'package:flutter/material.dart';
import 'package:hive/utils/utils.dart';
import 'package:line_icons/line_icons.dart';

import '../../../config/config.dart';

class BLScanWidget extends StatelessWidget {
  const BLScanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
          color: KColors.whiteSecondary,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          const CircleAvatar(
              backgroundColor: KColors.iconBgInactive,
              radius: 15,
              child: Icon(
                LineIcons.bluetooth,
                size: 20,
              )),
          10.vw,
          Text(
            "Scan for Smart Devices",
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 17),
          ),
          const Spacer(),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                  color: KColors.darkPrimary,
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: Text(
                  "scan",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: KColors.whitePrimary),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

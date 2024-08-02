import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:line_icons/line_icons.dart';

import '../../../config/config.dart';

class DeviceListWidget extends StatelessWidget {
  const DeviceListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.7,
        crossAxisCount: 2, // number of items in each row
        mainAxisSpacing: 8.0, // spacing between rows
        crossAxisSpacing: 8.0, // spacing between columns
      ),
      padding: const EdgeInsets.all(8.0), // padding around the grid
      itemCount: 4, // total number of items
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: KColors.cardBgInactive,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                  backgroundColor: KColors.iconBgInactive,
                  child: Icon(
                    LineIcons.lightbulb,
                    color: KColors.darkPrimary,
                  )),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Samsung Smart TV",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "2 devices",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: KColors.textInactive),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "OFF",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: KColors.textInactive, fontSize: 17),
                  ),
                  const Spacer(),
                  AdvancedSwitch(
                    onChanged: (val) {},
                    activeColor: KColors.darkPrimary,
                    initialValue: false,
                  ),
                ],
              )
            ],
          ),
        );
      },
    ));
  }
}

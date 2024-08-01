import 'package:flutter/material.dart';
import 'package:hive/config/colors/colors.dart';
import 'package:hive/config/data/exceptions/app_exceptions.dart';

import 'primary_button_widget.dart';

class InternetExceptionWidget extends StatelessWidget {
  const InternetExceptionWidget({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              backgroundColor: KColors.cardBgInactive,
              radius: 80,
              child: Center(
                child: Icon(
                  Icons.cloud_off_rounded,
                  size: 52,
                  color: KColors.error,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Text(
              "We're unable to show the results\nPlease check your internet\nconnection",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 20),
            ),
          ],
        ),
        PrimaryButtonWidget(
          onTap: onTap,
          label: "RETRY",
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../colors/colors.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({super.key, required this.onTap, required this.label});
  final Function() onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: KColors.cardBgInactive,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 14,
                    color: KColors.textMain,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            // 5.vw,
          ],
        ),
      ),
    );
  }
}

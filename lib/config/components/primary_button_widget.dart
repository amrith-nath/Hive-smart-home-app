import 'package:flutter/material.dart';

import '../colors/colors.dart';

class PrimaryButtonWidget extends StatefulWidget {
  const PrimaryButtonWidget(
      {super.key,
      required this.onTap,
      required this.label,
      this.useStyle2 = false,
      this.width = 150,
      this.height = 55});
  final double width;
  final double height;
  final Function()? onTap;
  final String label;
  final bool useStyle2;
  @override
  State<PrimaryButtonWidget> createState() => _PrimaryButtonWidgetState();
}

class _PrimaryButtonWidgetState extends State<PrimaryButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor:
              widget.useStyle2 ? KColors.cardBgInactive : KColors.darkPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
            side: const BorderSide(
              color: KColors.darkSecondary,
            ),
          ),
        ),
        onPressed: widget.onTap,
        child: Text(
          widget.label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: widget.useStyle2
                    ? KColors.darkPrimary
                    : KColors.whitePrimary,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}

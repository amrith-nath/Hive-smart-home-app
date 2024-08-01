import 'package:flutter/material.dart';

import '../colors/colors.dart';

class PrimaryButtonWidget extends StatefulWidget {
  const PrimaryButtonWidget(
      {super.key,
      required this.onTap,
      required this.label,
      this.width = 150,
      this.height = 55});
  final double width;
  final double height;
  final Function()? onTap;
  final String label;

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
          backgroundColor: KColors.darkPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        onPressed: widget.onTap,
        child: Text(
          widget.label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: KColors.whitePrimary,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}

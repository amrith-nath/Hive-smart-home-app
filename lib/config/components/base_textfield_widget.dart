import 'package:flutter/material.dart';

import '../colors/colors.dart';

class BaseTextFieldWidget extends StatelessWidget {
  const BaseTextFieldWidget({
    super.key,
    this.controller,
    required this.label,
    this.readOnly = false,
  });
  final TextEditingController? controller;

  final String label;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        readOnly: readOnly,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: KColors.textInactive,
                fontWeight: FontWeight.bold,
              ),
          floatingLabelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: KColors.darkPrimary,
                fontWeight: FontWeight.bold,
              ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: KColors.darkPrimary,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: KColors.darkSecondary,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: KColors.error,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: KColors.darkSecondary,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors/colors.dart';

class BaseTextFieldWidget extends StatelessWidget {
  const BaseTextFieldWidget({
    super.key,
    this.controller,
    required this.label,
    this.readOnly = false,
    this.numOnly = false,
  });
  final TextEditingController? controller;

  final String label;
  final bool readOnly;
  final bool numOnly;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Enter $label value";
          } else {
            return null;
          }
        },
        inputFormatters:
            numOnly ? [FilteringTextInputFormatter.digitsOnly] : null,
        keyboardType: numOnly ? TextInputType.number : null,
        readOnly: readOnly,
        controller: controller,
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 0.01),
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

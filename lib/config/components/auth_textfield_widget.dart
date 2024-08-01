import 'package:flutter/material.dart';

import '../colors/colors.dart';

class AuthTextFieldWidget extends StatelessWidget {
  const AuthTextFieldWidget({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.focusNode,
  });
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final bool obscureText;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
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
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: KColors.darkSecondary,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: KColors.error,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: KColors.darkSecondary,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIconColor: obscureText ? KColors.darkPrimary : KColors.warning,
          suffixIcon: suffixIcon),
    );
  }
}

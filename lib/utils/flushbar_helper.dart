import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:hive/config/colors/colors.dart';

class FlushbarHelperFnction {
  static void flushBarErrorMessage(
      {required BuildContext context, required String message}) {
    showFlushbar(
      context: context,
      flushbar: _baseBar(
          context,
          message,
          const Icon(
            Icons.error,
            color: KColors.error,
          ))
        ..show(context),
    );
  }

  static void flushBarInfoMessage(
      {required BuildContext context, required String message}) {
    showFlushbar(
      context: context,
      flushbar: _baseBar(
          context,
          message,
          const Icon(
            Icons.info,
            color: KColors.whitePrimary,
          ))
        ..show(context),
    );
  }

  static void flushBarWarningMessage(
      {required BuildContext context, required String message}) {
    showFlushbar(
      context: context,
      flushbar: _baseBar(
          context,
          message,
          const Icon(
            Icons.warning,
            color: KColors.warning,
          ))
        ..show(context),
    );
  }

  static void flushBarSuccessMessage(
      {required BuildContext context, required String message}) {
    showFlushbar(
      context: context,
      flushbar: _baseBar(
          context,
          message,
          const Icon(
            Icons.check_circle_rounded,
            color: KColors.success,
          ))
        ..show(context),
    );
  }

  static Flushbar _baseBar(context, message, icon) {
    return Flushbar(
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.decelerate,
      animationDuration: const Duration(milliseconds: 600),
      positionOffset: 50,
      duration: const Duration(seconds: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      backgroundColor: KColors.darkPrimary,
      borderRadius: BorderRadius.circular(10),
      icon: icon,
      messageText: Text(
        message,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: KColors.whitePrimary, fontSize: 14),
      ),
    );
  }
}

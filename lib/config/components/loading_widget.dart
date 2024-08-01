import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/config/colors/colors.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key, this.size = 30});

  final double size;
  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: widget.size,
        width: widget.size,
        child: Platform.isAndroid
            ? const CircularProgressIndicator(
                color: KColors.darkPrimary,
              )
            : const CupertinoActivityIndicator(
                color: KColors.darkPrimary,
              ),
      ),
    );
  }
}

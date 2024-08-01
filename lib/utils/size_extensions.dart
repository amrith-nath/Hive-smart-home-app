import 'package:flutter/material.dart';

extension SizeBoxes on num {
  SizedBox get vh => SizedBox(height: toDouble());
  SizedBox get vw => SizedBox(width: toDouble());
}
  // ···

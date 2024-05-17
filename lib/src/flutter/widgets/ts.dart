
import 'package:flutter/material.dart';

class TS extends TextStyle {
  const TS({
    double? s,
    Color? c,
    FontWeight? w,
    String? ff,
    TextBaseline? baseline,
    super.decoration,
    super.height,
    super.background,
    super.foreground,
    super.fontFeatures,
    super.shadows,
  }) : super(
          color: c,
          fontWeight: w,
          fontSize: s,
          textBaseline: baseline,
          fontFamily: ff,
        );
}

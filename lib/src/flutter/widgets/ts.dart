import 'package:flutter/material.dart';

class TS extends TextStyle {
  const TS({
    double? s,
    Color? c,
    FontWeight? w,
    String? ff,
    TextBaseline? baseline,
    super.background,
    super.decoration,
    super.fontFeatures,
    super.fontStyle,
    super.foreground,
    super.height,
    super.letterSpacing,
    super.shadows,
    super.wordSpacing,
  }) : super(
          color: c,
          fontFamily: ff,
          fontSize: s,
          fontWeight: w,
          textBaseline: baseline,
        );
}

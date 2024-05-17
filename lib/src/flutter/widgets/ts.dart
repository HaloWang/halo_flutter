import 'dart:ui';

import 'package:flutter/material.dart';

class TS extends TextStyle {
  const TS({
    double? s,
    Color? c,
    FontWeight? w,
    String? ff,
    TextBaseline? baseline,
    TextDecoration? decoration,
    double? height,
    Paint? background,
    Paint? foreground,
    List<FontFeature>? fontFeatures,
    List<Shadow>? shadows,
  }) : super(
          fontFeatures: fontFeatures,
          color: c,
          fontWeight: w,
          fontSize: s,
          decoration: decoration,
          height: height,
          textBaseline: baseline,
          fontFamily: ff,
          background: background,
          foreground: foreground,
          shadows: shadows,
        );
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class T extends Text {
  static const String kNullText = kDebugMode ? "debug:null" : "";

  const T(
    String? data, {
    super.key,
    TextStyle? s,
    super.textAlign,
    super.softWrap,
    super.maxLines,
    super.overflow,
    super.strutStyle,
    super.textDirection,
    super.locale,
    super.textScaler,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
  }) : super(
          data ?? kNullText,
          style: s,
        );
}

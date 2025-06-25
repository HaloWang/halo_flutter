import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class T extends Text {
  static const String _debugNullString = kDebugMode ? "debug:null" : "";

  const T(
    String? data, {
    TextStyle? s,
    super.key,
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
          data ?? _debugNullString,
          style: s,
        );
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class T extends Text {
  static const String kNullText = kDebugMode ? "debug:null" : "";
  const T(
    String? data, {
    TextStyle? s,
    TextAlign? textAlign,
    bool? softWrap,
    int? maxLines,
    TextOverflow? overflow,
    Key? key,
  }) : super(
          data ?? kNullText,
          key: key,
          maxLines: maxLines,
          softWrap: softWrap,
          textAlign: textAlign,
          style: s,
          overflow: overflow,
        );
}

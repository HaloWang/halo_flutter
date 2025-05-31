import 'package:flutter/material.dart';

@Deprecated("Use `Row` instead")
class Ro extends Row {
  const Ro({
    required super.children,
    super.key,
    MainAxisAlignment m = MainAxisAlignment.start,
    CrossAxisAlignment c = CrossAxisAlignment.center,
    super.mainAxisSize,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
  }) : super(
          mainAxisAlignment: m,
          crossAxisAlignment: c,
        );
}

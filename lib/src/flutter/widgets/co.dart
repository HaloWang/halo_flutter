import 'package:flutter/material.dart';

class Co extends Column {
  const Co({
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

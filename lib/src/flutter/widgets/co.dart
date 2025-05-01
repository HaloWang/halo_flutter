import 'package:flutter/material.dart';

class Co extends Column {
  const Co({
    required super.children,
    super.key,

    /// Main axis alignment
    MainAxisAlignment m = MainAxisAlignment.start,

    /// Cross axis alignment
    CrossAxisAlignment c = CrossAxisAlignment.center,

    /// Spacing between children
    double s = 0.0,
    super.mainAxisSize,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
  }) : super(
          mainAxisAlignment: m,
          crossAxisAlignment: c,
          spacing: s,
        );
}

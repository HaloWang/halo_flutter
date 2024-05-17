import 'package:flutter/material.dart';

class Ro extends Row {
  const Ro({
    required List<Widget> children,
    Key? key,
    MainAxisAlignment m = MainAxisAlignment.start,
    CrossAxisAlignment c = CrossAxisAlignment.center,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
  }) : super(
          children: children,
          key: key,
          mainAxisAlignment: m,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: c,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          textBaseline: textBaseline,
        );
}

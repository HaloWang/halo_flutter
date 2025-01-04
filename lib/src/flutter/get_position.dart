import 'package:flutter/material.dart';

Offset getPosition(GlobalKey key) {
  final RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
  final position = renderBox.localToGlobal(Offset.zero);
  return position;
}

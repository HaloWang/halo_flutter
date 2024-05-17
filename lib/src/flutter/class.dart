import 'package:flutter/material.dart';

class EI extends EdgeInsets {
  static const EI zero = EI.a(0);

  /// symmetric
  const EI.s({
    double? h,
    double? v,
    double l = 0.0,
    double t = 0.0,
  }) : super.symmetric(vertical: v ?? l, horizontal: h ?? t);

  /// only
  const EI.o({
    double? l,
    double? t,
    double? r,
    double? b,
    double h = 0.0,
    double v = 0.0,
  }) : super.only(
          left: l ?? h,
          right: r ?? h,
          top: t ?? v,
          bottom: b ?? v,
        );

  /// fromLTRB
  const EI.f(
    double l,
    double t,
    double r,
    double b,
  ) : super.fromLTRB(l, t, r, b);

  /// all
  const EI.a(super.value) : super.all();
}

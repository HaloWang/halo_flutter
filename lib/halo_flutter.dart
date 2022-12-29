library halo_flutter;

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

typedef BD = BoxDecoration;
typedef BR = BorderRadius;
typedef C = Container;
typedef CAA = CrossAxisAlignment;
typedef Exp = Expanded;
typedef FW = FontWeight;
typedef GD = GestureDetector;
typedef MAA = MainAxisAlignment;
typedef OB = OutlinedButton;
typedef SB = SizedBox;

const kW = Colors.white;
const kB = Colors.black;
const kC = Colors.transparent;
const kHint = Color(0x66FF0000);
const kHintG = Color(0x6600FF00);

extension HLWidget on Widget {
  Container get wbg {
    return Container(
      color: Colors.white,
      child: this,
    );
  }

  Widget get debugRed {
    if (kDebugMode) {
      return Container(
        color: const Color.fromRGBO(255, 0, 0, 0.2),
        child: this,
      );
    } else {
      return this;
    }
  }
}

extension HLColor on Color {
  Color wo(double opacity) {
    return withOpacity(opacity);
  }
}

class EI extends EdgeInsets {
  static const EI zero = EI.a(0);

  /// symmetric
  const EI.s({
    double v = 0.0,
    double h = 0.0,
  }) : super.symmetric(vertical: v, horizontal: h);

  /// only
  const EI.o({
    double l = 0.0,
    double t = 0.0,
    double r = 0.0,
    double b = 0.0,
  }) : super.only(
          left: l,
          top: t,
          right: r,
          bottom: b,
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

extension HLStringFlutter on String {
  Text ts({
    Color? c,
    FontWeight? w,
    TextAlign? textAlign,
    TextBaseline? baseline,
    TextDecoration? decoration,
    bool? softWrap,
    double? height,
    double? s,
    int? maxLines,
  }) {
    return T(
      this,
      maxLines: maxLines,
      softWrap: softWrap,
      textAlign: textAlign,
      s: TextStyle(
        color: c,
        decoration: decoration,
        fontSize: s,
        fontWeight: w,
        height: height,
        textBaseline: baseline,
      ),
    );
  }
}

extension HLNum on num {
  SizedBox get h {
    return SizedBox(height: toDouble());
  }

  SizedBox get w {
    return SizedBox(width: toDouble());
  }

  BorderRadius get r {
    return BorderRadius.circular(toDouble());
  }

  Text ts({
    Color? c,
    FontWeight? w,
    TextAlign? textAlign,
    TextBaseline? baseline,
    TextDecoration? decoration,
    bool? softWrap,
    double? height,
    double? s,
    int? maxLines,
  }) {
    return T(
      toString(),
      maxLines: maxLines,
      softWrap: softWrap,
      textAlign: textAlign,
      s: TextStyle(
        color: c,
        decoration: decoration,
        fontSize: s,
        fontWeight: w,
        height: height,
        textBaseline: baseline,
      ),
    );
  }
}

class TS extends TextStyle {
  const TS({
    Color? c,
    FontWeight? w,
    TextBaseline? baseline,
    TextDecoration? decoration,
    double? height,
    double? s,
    String? ff,
  }) : super(
          color: c,
          fontWeight: w,
          fontSize: s,
          decoration: decoration,
          height: height,
          textBaseline: baseline,
          fontFamily: ff,
        );
}

class T extends Text {
  static const kNullText = kDebugMode ? "null" : "";
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

class Ro extends Row {
  Ro({
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

class Co extends Column {
  Co({
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

// https://stackoverflow.com/questions/50316219/how-to-get-widgets-absolute-coordinates-on-a-screen-in-flutter
extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      final offset = Offset(translation.x, translation.y);
      return renderObject!.paintBounds.shift(offset);
    } else {
      return null;
    }
  }
}

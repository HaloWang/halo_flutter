library halo_flutter;

import 'package:halo_dart/halo_dart.dart';

import "dart:math";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

typedef BD = BoxDecoration;
typedef BR = BorderRadius;
typedef C = Container;
typedef CAA = CrossAxisAlignment;
typedef EI = EdgeInsets;
typedef FW = FontWeight;
typedef GD = GestureDetector;
typedef MAA = MainAxisAlignment;
typedef SB = SizedBox;
typedef Exp = Expanded;

const kW = Colors.white;
const kB = Colors.black;
const kC = Colors.transparent;
const kHint = Color(0x66FF0000);
const kHintG = Color(0x6600FF00);

var kLoremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

extension HLList<T> on List<T> {
  List<R> indexMap<R>(
    R Function(int index, T value) convert, {
    bool growable = false,
  }) {
    final result = asMap()
        .map((index, value) => MapEntry(
              index,
              convert(index, value),
            ))
        .values
        .toList(
          growable: growable,
        );
    return result;
  }

  List<R> m<R>(
    R Function(T value) convert, {
    bool growable = false,
  }) {
    final result = asMap()
        .map((index, value) => MapEntry(
              index,
              convert(value),
            ))
        .values
        .toList(growable: growable);
    return result;
  }
}

extension HLMap<K, V> on Map<K, V> {
  List<V> get v => values.toList();
  List<K> get k => keys.toList();

  List<R> indexMap<R>(
    R Function(K key, V value) convert, {
    bool growable = false,
  }) {
    final result = map((key, value) => MapEntry(
              key,
              convert(key, value),
            )).values.toList(
          growable: growable,
        );
    return result;
  }

  Map<String, String> get allString {
    final Map<String, String> result = {};
    forEach((key, value) {
      final k = key.toString();
      final v = value.toString();
      result[k] = v;
    });
    return result;
  }

  Map<K, V> get withoutNull {
    Map<K, V> result = {};

    for (var key in keys) {
      if (this[key] != null) {
        result[key] = this[key] as V;
      }
    }

    return result;
  }
}

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

extension HLInt on int {
  Duration get ms {
    return Duration(milliseconds: this);
  }
}

extension HLBool on bool {
  int get toInt {
    return this ? 1 : 0;
  }
}

extension HLString on String {
  int get toInt {
    return int.parse(this);
  }

  // Use Extension
  String get breakWord {
    String breakWord = '';
    for (var element in runes) {
      breakWord += String.fromCharCode(element);
      breakWord += '\u200B';
    }
    return breakWord;
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

Future<void> after(Duration duration, VoidCallback? task) {
  return Future.delayed(duration, task);
}

Future<void> last(VoidCallback task) {
  return Future.delayed(0.ms, task);
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

List<T> gen({
  required int times,
  required T Function(int time) qqq,
}) {
  List<T> list = [];
  for (var i = 0; i < times; i++) {
    list.add(qqq(i));
  }
  return list;
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

final _rnd = Random();
const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

int randomNumber(int length) {
  var next = _rnd.nextDouble() * pow(10, length);
  while (next < pow(10, length - 1)) {
    next *= 10;
  }
  return next.toInt();
}

String randomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

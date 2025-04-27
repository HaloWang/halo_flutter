import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:halo/src/dart/extensions.dart';
import 'package:halo/src/dart/typedef.dart';

abstract class HF {
  static final _rnd = Random();

  static const _chars = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890";

  static final _codeSpacing = " ".codeUnits[0];

  static final number = _Number();

  // TODO: Finish this
  static final _json = _JSON();

  // TODO: Finish this
  static final _random = _Random();

  /// Wait milliseconds
  static Future<void> wait(int ms) {
    return Future.delayed(Duration(milliseconds: ms));
  }

  static List<Map> listMap(Object? object) {
    try {
      return list(object).mv;
    } catch (e) {
      throw "halo_flutter: Enement in list is not Map";
    }
  }

  static List<JSON> listJSON(Object? object) {
    try {
      final r = list(object).jv;
      return r;
    } catch (e) {
      throw "halo_flutter: Enement in list is not JSON";
    }
  }

  /// [Map<dynamic, dynamic>] to [Map<String, dynamic>]
  static JSON json(Map object) {
    try {
      final r = object.map((k, v) => MapEntry(k.toString(), v));
      return r;
    } catch (e) {
      throw "halo_flutter: Target is not JSON:\n$e\n$object";
    }
  }

  static List<JSON> jsonArray(Object? object) {
    try {
      final r = listMap(object).map((e) => json(e));
      return r.toList();
    } catch (e) {
      throw "halo_flutter: Target is not JSON Array:\n$e\n$object";
    }
  }

  static List list(Object? object) {
    try {
      return object as List;
    } catch (e) {
      throw "halo_flutter: Target is not List:\n$e\n$object";
    }
  }

  static int randomInt({
    int min = 1,
    int max = 9999999,
  }) {
    return _rnd.nextInt(max - min + 1) + min;
  }

  static int randomMax(int max) {
    return _rnd.nextInt(max + 1);
  }

  static String randomString({
    int min = 1,
    int max = 2000,
    double spacingRate = 0.20,
    String? template,
  }) {
    if (template != null && template.isNotEmpty) {
      min = template.length;
      max = template.length;
      final spaceCount = template.split(" ").length;
      spacingRate = spaceCount / template.length;
    }
    final fixed = max <= min;
    final length = fixed ? min : _rnd.nextInt(max - min) + min;
    final enableSpaceTrimming = length >= 2;
    // var useSpace = _rnd.nextDouble() < spacingRate;
    bool previousUseSpace = false;
    final codes = Iterable.generate(length, (index) {
      final isHead = index == 0;
      final isTail = index == length - 1;
      final useSpace = !previousUseSpace && _rnd.nextDouble() < spacingRate;
      previousUseSpace = useSpace;

      // If length is bigger or equal to 2, use space trimming, no space at head and tail
      if (useSpace && enableSpaceTrimming && !isHead && !isTail) {
        return _codeSpacing;
      }
      // If length is smaller than 2, use space trimming, allow space at head and tail
      if (useSpace && !enableSpaceTrimming) {
        return _codeSpacing;
      }
      return _chars.codeUnitAt(_rnd.nextInt(_chars.length));
    });

    final r = String.fromCharCodes(codes);
    return r;
  }

  static bool randomBool({double truePercentage = 0.5}) {
    if (truePercentage == 0.5) return _rnd.nextBool();
    final double percentage = max(0, min(1, truePercentage));
    final next = _rnd.nextDouble() < percentage;
    return next;
  }

  // TODO: 要是能注入 Debug 时间就最好了

  static int get microseconds => DateTime.now().microsecondsSinceEpoch;

  static int get milliseconds => DateTime.now().millisecondsSinceEpoch;

  static int get seconds => DateTime.now().millisecondsSinceEpoch ~/ 1000;

  /// µs, microseconds since 2025-04-22 14:30:00 (GMT+8)
  static int get shorterUS => microseconds - 1745303400000000;

  /// ms, milliseconds since 2025-04-22 14:30:00 (GMT+8)
  static int get shorterMS => milliseconds - 1745303400000;

  /// s, seconds since 2025-04-22 14:30:00
  static int get shorterS => seconds - 1745303400;

  /// µs, microseconds since 2025-04-22 14:30:00 (GMT+8) in debug mode, otherwise since 1970
  static int get debugShorterUS => kDebugMode ? shorterUS : microseconds;

  /// ms, milliseconds since 2025-04-22 14:30:00 (GMT+8) in debug mode, otherwise since 1970
  static int get debugShorterMS => kDebugMode ? shorterMS : milliseconds;

  /// s, seconds since 2025-04-22 14:30:00 (GMT+8) in debug mode, otherwise since 1970
  static int get debugShorterS => kDebugMode ? shorterS : seconds;
}

class _Number {
  num? from(Object? value) {
    if (value is num) return value;
    if (value is int) return value;
    if (value is String) return num.tryParse(value);
    throw "halo_flutter: Target is not Number:\n$value";
  }
}

class _JSON {}

class _Random {}

import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:halo/src/dart/extensions.dart';
import 'package:halo/src/dart/typedef.dart';

abstract class HF {
  static late final int _initTimeS;
  static late final int _initTimeMS;
  static late final int _initTimeUS;

  static void init() {
    _initTimeS = HF.seconds;
    _initTimeMS = HF.milliseconds;
    _initTimeUS = HF.microseconds;
  }

  static final _rnd = Random();

  static const _chars = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890";

  static final _codeSpacing = " ".codeUnits[0];

  static final number = _Number();

  // TODO: Finish this
  // ignore: unused_field
  static final _json = _JSON();

  static final random = _Random();

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

  static int get shorterUS => microseconds - _initTimeUS;

  static int get shorterMS => milliseconds - _initTimeMS;

  static int get shorterS => seconds - _initTimeS;

  static int get debugShorterUS => kDebugMode ? shorterUS : microseconds;

  static int get debugShorterMS => kDebugMode ? shorterMS : milliseconds;

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

class _Random {
  final color = _RandomColor();
}

class _RandomColor {
  static final _rnd = Random();

  Color get q => Color.fromARGB(
        _rnd.nextInt(0xFF),
        _rnd.nextInt(0xFF),
        _rnd.nextInt(0xFF),
        _rnd.nextInt(0xFF),
      );

  Color get vivid {
    final channel = _rnd.nextInt(3);
    final dim = _rnd.nextInt(2);
    late final int r, g, b;
    final dynamicValue = _rnd.nextInt(0xFF);

    if (channel == 0) {
      if (dim == 0) {
        r = 0xFF;
        g = 0x00;
        b = dynamicValue;
      } else {
        r = 0xFF;
        g = dynamicValue;
        b = 0x00;
      }
    } else if (channel == 1) {
      if (dim == 0) {
        r = 0x00;
        g = 0xFF;
        b = dynamicValue;
      } else {
        r = dynamicValue;
        g = 0xFF;
        b = 0x00;
      }
    } else {
      if (dim == 0) {
        r = 0x00;
        g = dynamicValue;
        b = 0xFF;
      } else {
        r = dynamicValue;
        g = 0x00;
        b = 0xFF;
      }
    }

    return Color.fromARGB(0xFF, r, g, b);
  }
}

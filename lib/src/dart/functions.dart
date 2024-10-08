import 'dart:math';

import 'package:halo/src/dart/extensions.dart';

abstract class HF {
  static final _rnd = Random();

  static const _chars = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890";

  static final _codeSpacing = " ".codeUnits[0];

  /// Wait milliseconds
  static Future<void> wait(int ms) {
    return Future.delayed(Duration(milliseconds: ms));
  }

  static List<Map> listMap(Object? object) {
    try {
      return list(object).mv;
    } catch (e) {
      throw "Enement in list is not Map";
    }
  }

  static List list(Object? object) {
    try {
      return object as List;
    } catch (e) {
      throw "Target is not List";
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
    double spacingRate = 0.05,
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
    var useSpace = _rnd.nextDouble() < spacingRate;
    final codes = Iterable.generate(length, (index) {
      final notHead = index != 0;
      final notTail = index <= length - 1;
      useSpace = !useSpace && _rnd.nextDouble() < spacingRate;
      if (useSpace && notHead && notTail) {
        return _codeSpacing;
      } else {
        return _chars.codeUnitAt(_rnd.nextInt(_chars.length));
      }
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
}

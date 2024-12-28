import 'dart:math';

import 'package:halo/src/dart/extensions.dart';
import 'package:halo/src/dart/typedef.dart';

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

  static List<JSON> listJSON(Object? object) {
    try {
      final r = list(object).jv;
      return r;
    } catch (e) {
      throw "Enement in list is not JSON";
    }
  }

  /// Map<dynamic, dynamic> to Map<String, dynamic>
  static JSON json(Map object) {
    try {
      final r = object.map((k, v) => MapEntry(k.toString(), v));
      return r;
    } catch (e) {
      throw "Target is not JSON:\n$e\n$object";
    }
  }

  static List<JSON> jsonArray(Object? object) {
    try {
      final r = listMap(object).map((e) => json(e));
      return r.toList();
    } catch (e) {
      throw "Target is not JSON Array:\n$e\n$object";
    }
  }

  static List list(Object? object) {
    try {
      return object as List;
    } catch (e) {
      throw "Target is not List:\n$e\n$object";
    }
  }

  static num? number(Object? value) {
    if (value is num) return value;
    if (value is int) return value;
    if (value is String) return num.tryParse(value);
    throw "Target is not Number:\n$value";
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
}

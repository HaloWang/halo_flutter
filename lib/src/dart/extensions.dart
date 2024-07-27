import 'dart:math';

import 'package:collection/collection.dart';

extension HaloObjectNull on Object? {
  Map get mapValue {
    try {
      return this as Map;
    } catch (e) {
      return {};
    }
  }

  List get listValue {
    try {
      return this as List;
    } catch (e) {
      return [];
    }
  }
}

extension HaloDartNumT<T extends num> on T {
  T squeeze(T min, T max) {
    if (this < min) return min;
    if (this > max) return max;
    return this;
  }
}

extension HaloDartNum on num {
  String get withoutZero => toString().withoutZero;

  Duration get ms => Duration(milliseconds: toInt());
}

extension HaloDartInt on int {
  int get withoutNegative => max(0, this);
}

extension HaloDartDouble on double {
  double get withoutNegative => max(0.0, this);
}

extension HaloDartBool on bool {
  get int => this ? 1 : 0;
}

extension HaloDartIterable<T> on Iterable<T> {
  List<R> indexMap<R>(
    R Function(int index, T value) convert, {
    bool growable = false,
  }) =>
      toList(growable: growable).indexMap(convert, growable: growable);

  List<R> m<R>(
    R Function(T value) convert, {
    bool growable = false,
  }) =>
      toList(growable: growable).m(convert, growable: growable);
}

extension HaloDartList<T> on List<T> {
  /// [dart growable performance](https://stackoverflow.com/questions/15943890/is-there-a-performance-benefit-in-using-fixed-length-lists-in-dart)
  List<R> indexMap<R>(
    R Function(int index, T value) convert, {
    bool growable = false,
  }) {
    final result = asMap()
        .map((index, value) {
          return MapEntry(
            index,
            convert(index, value),
          );
        })
        .values
        .toList(growable: growable);
    return result;
  }

  /// [dart growable performance](https://stackoverflow.com/questions/15943890/is-there-a-performance-benefit-in-using-fixed-length-lists-in-dart)
  List<R> m<R>(
    R Function(T value) convert, {
    bool growable = false,
  }) {
    final result = asMap()
        .map((index, value) {
          return MapEntry(
            index,
            convert(value),
          );
        })
        .values
        .toList(growable: growable);
    return result;
  }

  void removeFirstWhere(bool Function(T element) test) {
    final e = firstWhereOrNull(test);
    if (e == null) return;
    for (var element in this) {
      final r = test(element);
      if (r) {
        remove(element);
        return;
      }
    }
  }

  List<Map> get mv {
    return map((e) => e.mapValue).toList();
  }
}

extension HaloDartListString on List<String> {
  /// 将分散的信息去重聚合
  ///
  /// TODO: 要计算冲突, "abc", "bcd", "bc", "ac" -> "???"
  ///
  /// "a", "ab" -> "ab"
  ///
  /// "a", "abc" -> "abc"
  ///
  /// "a", "ab", "abcd" -> "abcd"
  ///
  /// "book", "books" -> "books"
  List<String> get longestParenetString {
    final wantedKeys = [...this];
    for (var i = 0; i < length; i++) {
      final keyInTotal = this[i];
      if (!wantedKeys.contains(keyInTotal)) continue;
      final List<String> needToRemove = [];

      if (keyInTotal.length < 2) continue;

      for (var j = 0; j < wantedKeys.length; j++) {
        final keyInWanted = wantedKeys[j];
        if (keyInTotal.contains(keyInWanted) && keyInTotal != keyInWanted) {
          needToRemove.add(keyInWanted);
        }
      }
      for (var element in needToRemove) {
        wantedKeys.remove(element);
      }
    }

    return wantedKeys;
  }
}

extension HaloDartMap<K, V> on Map<K, V> {
  List<V> get v => values.toList();
  List<K> get k => keys.toList();

  List<R> indexMap<R>(
    R Function(K key, V value) convert, {
    bool growable = false,
  }) {
    final result = map((key, value) {
      return MapEntry(
        key,
        convert(key, value),
      );
    }).values.toList(growable: growable);
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

  Map<K, V> get trim {
    Map<K, V> result = {};

    for (var key in keys) {
      final value = this[key] as V;
      if (value is String) {
        result[key] = value.trim() as V;
      } else {
        result[key] = value;
      }
    }

    return result;
  }
}

extension HaloDartString on String {
  String get withoutZero {
    if (endsWith(".0")) {
      return substring(0, length - 2);
    }
    if (endsWith(".00")) {
      return substring(0, length - 3);
    }
    return this;
  }

  /// Example
  ///
  /// 将成串的信息拆分, 分成更小的信息片段
  ///
  /// when [minLength] == 1
  ///
  /// abc => ab, bc
  ///
  /// when [minLength] == 2
  ///
  ///  abc => abc
  ///
  /// when [minLength] == 3
  ///
  /// abcd => abcd, abc, bcd
  ///
  /// abcde => abced, abcd, bcde, abc, bcd, cde
  ///
  /// abcdef => abcedf, abcde, bcdef, abcd, bcde, cdef, abc, bcd, cde, def

  // 动词的第三人称单数 -> 包含
  // 名次的复数形式 -> 包含
  // 某种学术名词 -> https://www.thefreedictionary.com/words-that-start-with-electro
  // electro+analysis
  // electro+chemical
  // ...

  // 因为我期望, 记住两个较简单的元素, 即可组成新词

  // 撒，播撒；（使）散开，（使）散布在各处；
  List<String> scatter({int minLength = 1}) {
    final List<String> subSequence = [];
    if (length <= minLength) return [this];

    /// Used to decrease loop
    final iBias = minLength - 1;

    for (var i = 0; i < length; i++) {
      for (var j = length; j > i + iBias; j--) {
        final sub = substring(i, j);
        subSequence.add(sub);
      }
    }
    return subSequence;
  }
}

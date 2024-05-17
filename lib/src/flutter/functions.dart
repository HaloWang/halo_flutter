import 'dart:async';

import 'package:flutter/foundation.dart';

/// 测量 [work] 的延迟
///
/// 仅在 Debug 时才会返回延迟时间(ms), 在其他模式下均返回 0.0
Future<(T, double)> measureDebug<T>(Future<T> work) async {
  if (kDebugMode) {
    final before = DateTime.now().microsecondsSinceEpoch;
    final r = await work;
    final after = DateTime.now().microsecondsSinceEpoch;
    final duration = (after - before) / 1000.0;
    return (r, duration);
  } else {
    final r = await work;
    return (r, 0.0);
  }
}

/// 测量 [work] 的延迟
///
/// 仅在 Debug 时才会返回延迟时间(ms), 在其他模式下均返回 0.0
(T, int) testDurationSync<T>(T Function() work) {
  if (!kDebugMode) {
    final r = work();
    return (r, 0);
  }

  final before = DateTime.now().microsecondsSinceEpoch;
  final r = work();
  final after = DateTime.now().microsecondsSinceEpoch;
  final duration = (after - before) ~/ 1000.0;
  return (r, duration);
}

Future<(T, int)> testDuration<T>(Future<T> Function() work) async {
  if (!kDebugMode) {
    final r = await work();
    return (r, 0);
  }

  final before = DateTime.now().microsecondsSinceEpoch;
  final r = await work();
  final after = DateTime.now().microsecondsSinceEpoch;
  final duration = (after - before) ~/ 1000;
  return (r, duration);
}

import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:halo/halo.dart';
import 'package:halo/src/flutter/widgets/rect_debugger.dart';

extension HaloNumT<T extends num> on T {
  BorderRadius get r => BorderRadius.circular(toDouble());

  Radius get rr => Radius.circular(toDouble());

  SB get h => SB(height: toDouble());

  SB get w => SB(width: toDouble());

  double get dv => toDouble();
}

extension HaloColor on Color {
  @Deprecated("Use `q` instead")
  Color wo(double opacity) => withOpacity(opacity);

  /// Shortcut for "with opacity"
  ///
  /// ### Example
  ///
  /// ```dart
  /// const color = Colors.white;
  /// final colorWithOpacity = color.q(.5);
  /// ```
  Color q(double alpha) => withValues(alpha: alpha);
}

extension HaloMap<K, V> on Map<K, V> {
  Map<K, V> get sorted {
    final sorted = SplayTreeMap<K, V>.from(this);
    final result = Map.fromEntries(sorted.entries);
    final deepResult = <K, V>{};
    result.forEach((key, value) {
      if (value is Map) {
        deepResult[key] = value.debugSorted as V;
      } else if (value is List) {
        final deepList = [];
        value.forEach((element) {
          if (element is Map) {
            deepList.add(element.debugSorted);
          } else {
            deepList.add(element);
          }
        });
        deepResult[key] = deepList as V;
      } else {
        deepResult[key] = value;
      }
    });
    return deepResult;
  }

  Map<K, V> get debugSorted {
    if (!kDebugMode) return this;
    return sorted;
  }
}

extension HaloListWidget on List<Widget> {
  List<Widget> widgetJoin(Widget Function(int previousIndex) convert) {
    List<Widget> r = [];
    final l = length;
    for (var i = 0; i < l; i++) {
      r.add(this[i]);
      final j = i;
      if (i < length - 1) {
        final sep = convert(j);
        r.add(sep);
      }
    }
    return r;
  }
}

extension HaloListSpan on List<InlineSpan> {
  List<InlineSpan> spanJoin(InlineSpan Function(int previousIndex) convert) {
    List<InlineSpan> r = [];
    final l = length;
    for (var i = 0; i < l; i++) {
      r.add(this[i]);
      final j = i;
      if (i < length - 1) {
        final sep = convert(j);
        r.add(sep);
      }
    }
    return r;
  }
}

extension WidgetDebugger on Widget {
  Widget get debug {
    if (!kDebugMode) return this;
    if (runtimeType == Spacer) {
      qqw("WidgetDebugger.debug: Spacer is not supported");
      return this;
    }
    return RectDebugger(child: this);
  }

  Widget get debugq {
    return this;
  }
}

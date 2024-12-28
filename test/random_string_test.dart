import 'package:flutter_test/flutter_test.dart';
import 'package:halo/halo.dart';

void main() {
  test("fuck_1", () {
    final o = HF.randomString(min: 1, max: 1, spacingRate: 1);
    expect(o.length, 1);
    expect(o, " ");
  });

  test("fuck_2", () {
    final o = HF.randomString(min: 1, max: 1, spacingRate: 0);
    expect(o.length, 1);
    expect(o != " ", true);
  });

  test("fuck_3", () {
    final o = HF.randomString(min: 1, max: 1000, spacingRate: 0.9);
    expect(o.length <= 1000, true);
    expect(o.isNotEmpty, true);
    expect(o.contains(" "), true);
    expect(o.contains("  "), false);
    expect(o.startsWith(" "), false);
    expect(o.endsWith(" "), false);
  });

  test("fuck_4", () {
    const count = 10000;
    final results = <String>[];
    for (var i = 0; i < count; i++) {
      final o = HF.randomString(min: 1, max: 1, spacingRate: 0.5);
      results.add(o);
      expect(o.length, 1);
    }
    expect(results.length, count);
    expect(results.contains(" "), true);
    expect(results.contains("  "), false);
    expect(results.contains(""), false);
    expect(results.contains("a"), true);
  });
}

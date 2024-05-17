import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:halo/halo.dart';

void main() {
  test("random string - 1", () {
    final r = randomString(max: 20, min: 10);
    if (kDebugMode) print(r);
    expect(r.length <= 20, true);
    expect(r.length >= 10, true);
    expect(r.isNotEmpty, true);
  });

  test("random int - 1", () {
    const max = 99;
    const min = 98;
    final r = randomInt(min: min, max: max);
    expect(r <= max, true);
    expect(r >= min, true);
  });
}

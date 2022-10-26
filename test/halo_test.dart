import 'package:flutter_test/flutter_test.dart';

import 'package:halo/halo.dart';

void main() {
  test('random string length', () {
    final rs = randomString(10);
    expect(rs.length, 10);
  });
}

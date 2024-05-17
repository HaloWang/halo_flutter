import 'package:flutter_test/flutter_test.dart';
import 'package:halo/halo.dart';

void main() {
  test("1", () {
    const i = ["a", "ab"];
    final o = i.longestParenetString;
    expect(o.length, 1);
    expect(o[0], "ab");
  });

  test("2", () {
    const i = ["a", "ab", "abcd"];
    final o = i.longestParenetString;
    expect(o.length, 1);
    expect(o[0], "abcd");
  });

  test("3", () {
    const i = ["a", "ab", "bc"];
    final o = i.longestParenetString;
    expect(o.length, 2);
    expect(o[0], "ab");
    expect(o[1], "bc");
  });

  test("4", () {
    const i = ["show", "time", "owt", "tim", "how", "ti", "wt"];
    final o = i.longestParenetString;
    expect(o.contains("show"), true);
    expect(o.contains("time"), true);
    expect(!o.contains("how"), true);
    expect(o.contains("owt"), true);
    expect(!o.contains("ti"), true);
    expect(!o.contains("wt"), true);
  });
}

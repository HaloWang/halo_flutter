import 'dart:math';

/// Wait milliseconds
///
/// 🚧 别忘了 await
Future<void> wait(int ms) {
  return Future.delayed(Duration(milliseconds: ms));
}

final _rnd = Random();

const _chars = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890";

final _codeSpacing = " ".codeUnits[0];

int randomInt({
  int min = 1,
  int max = 9999999,
}) {
  return _rnd.nextInt(max - min) + min;
}

String randomString({
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

bool randomBool({double truePercentage = 0.5}) {
  if (truePercentage == 0.5) return _rnd.nextBool();
  final double percentage = max(0, min(1, truePercentage));
  final next = _rnd.nextDouble() < percentage;
  return next;
}

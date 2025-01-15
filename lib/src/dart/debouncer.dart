import 'dart:async';

class Debouncer {
  final int milliseconds;
  void Function()? _action;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(void Function() action) {
    final duration = Duration(milliseconds: milliseconds);
    _timer?.cancel();
    _action = action;
    _timer = Timer(duration, () {
      _action?.call();
    });
  }
}

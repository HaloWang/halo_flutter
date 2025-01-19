import 'dart:async';

class Throttler {
  final int milliseconds;
  Timer? _timer;
  bool _isReady = true;

  Throttler({required this.milliseconds});

  @Deprecated("Use call instead")
  void run(Function action) {
    if (!_isReady) return;
    final duration = Duration(milliseconds: milliseconds);
    _isReady = false;
    action();
    _timer = Timer(duration, () {
      _isReady = true;
    });
  }

  void call(Function action) {
    if (!_isReady) return;
    final duration = Duration(milliseconds: milliseconds);
    _isReady = false;
    action();
    _timer = Timer(duration, () {
      _isReady = true;
    });
  }

  void cancel() {
    _timer?.cancel();
    _isReady = true;
  }
}

import 'dart:async';

class Throttler {
  final int milliseconds;

  final bool trailing;
  Function? _pendingCall;

  Timer? _timer;
  bool _isReady = true;

  Throttler({required this.milliseconds, this.trailing = false});

  @Deprecated("Use call instead")
  void run(Function action) => call(action);

  void call(Function action) {
    if (_isReady) {
      // 可以立即执行
      _isReady = false;
      action();
      _timer = Timer(Duration(milliseconds: milliseconds), _onTimerComplete);
    } else if (trailing) {
      // 存储最后一次调用
      _pendingCall = action;
    }
  }

  void _onTimerComplete() {
    _isReady = true;

    // 如果启用了尾部调用并且有待执行的调用
    if (trailing && _pendingCall != null) {
      final pendingCall = _pendingCall;
      _pendingCall = null;
      _isReady = false;
      pendingCall!();
      _timer = Timer(Duration(milliseconds: milliseconds), _onTimerComplete);
    }
  }

  void cancel() {
    _timer?.cancel();
    _pendingCall = null;
    _isReady = true;
  }
}

import 'dart:async';

class Debouncer {
  final int milliseconds;
  void Function()? _action;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(void Function() action) {
    _timer?.cancel(); // 取消之前的定时器
    _action = action;
    _timer = Timer(Duration(milliseconds: milliseconds), () {
      _action?.call(); // 在延迟后执行动作
    });
  }
}

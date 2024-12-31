import 'dart:async';
import 'dart:collection';

class EventDistributor {
  final Duration interval;
  final Queue<Function> _eventQueue = Queue();
  Timer? _timer;

  EventDistributor(this.interval);

  void addEvent(Function event) {
    _eventQueue.add(event);
    _startTimer();
  }

  void _startTimer() {
    if (_timer?.isActive ?? false) return;

    _timer = Timer.periodic(interval, (timer) {
      if (_eventQueue.isEmpty) {
        timer.cancel();
        return;
      }

      final event = _eventQueue.removeFirst();
      event(); // Execute the event
    });
  }
}

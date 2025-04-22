// ignore_for_file: unused_element

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:halo/halo.dart';

void main() {
  // _testEventDistributor();
  // _testThrottler();
  runApp(const _App());
}

final throttler = Throttler(milliseconds: 100);

void _testThrottler() async {
  if (kDebugMode) print("💬 _testThrottler start");
  for (int i = 0; i < 10000; i++) {
    await HF.wait(10);
    throttler.run(() {
      if (kDebugMode) print('event $i');
    });
  }
  // await HF.wait(1000);
  // if (kDebugMode) print("💬 _testThrottler done");
}

void _testEventDistributor() {
  EventDistributor eventDistributor = EventDistributor(const Duration(milliseconds: 100));
  for (int i = 0; i < 100; i++) {
    eventDistributor.addEvent(() {
      if (kDebugMode) print('event $i');
    });
  }

  Future.delayed(const Duration(milliseconds: 1000), () {
    eventDistributor.executeAllRemaining();
  });
}

void _test() {
  if (kDebugMode) print("💬 _test start");
  _testThrottler();
  if (kDebugMode) print("💬 _test done");
}

class _App extends StatelessWidget {
  const _App();

  void _test2() {
    qqq("HF.debugShorterUS: ${HF.debugShorterUS}");
    qqq("HF.debugShorterMS: ${HF.debugShorterMS}");
    qqq("HF.debugShorterS: ${HF.debugShorterS}");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _test2,
          child: Text('Test'),
        ),
      ),
    );
  }
}

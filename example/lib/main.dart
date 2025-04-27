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

class _App extends StatefulWidget {
  const _App();

  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {
  Color? _color;

  void _testUSMSS() {
    qqq("HF.debugShorterUS: ${HF.debugShorterUS}");
    qqq("HF.debugShorterMS: ${HF.debugShorterMS}");
    qqq("HF.debugShorterS: ${HF.debugShorterS}");
  }

  void _testHFFunctions() {
    const r0 = 0xFF;
    qqr(r0);
    const r1 = 0x80;
    qqr(r1);
    const r2 = 0x00;
    qqr(r2);
    final r3 = Color.from(alpha: 1, red: 1, green: 1, blue: 1);
    qqr(r3);
    final r4 = Color.fromARGB(255, 255, 255, 255);
    qqr(r4);
    const r5 = 0xFF == 255;
    qqr(r5);
    const r6 = 0x80 == 128;
    qqr(r6);
    const r7 = 0x00 == 0;
    qqr(r7);
    // _color = HF.random.color.vivid;
    _color = HF.random.color.q.q(0xFF);
    qqr(_color);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: kB,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        backgroundColor: kB,
        body: Center(
          child: C(
            height: 100,
            width: 100,
            decoration: BD(color: _color),
            child: Text('Hello World!'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _testHFFunctions,
          child: Text('Test'),
        ),
      ),
    );
  }
}

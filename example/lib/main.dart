import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:halo/halo.dart';

void main() {
  _testEventDistributor();
  runApp(const _App());
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
  final source = {
    "a": 1,
    2: "3",
  };
  final json = HF.json(source);
  print(json);

  final list = [
    {"a": 1},
    {2: 3, "2": 4},
  ];
  final jsonArray = HF.jsonArray(list);
  print(jsonArray);
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _test,
          child: Text('Test'),
        ),
      ),
    );
  }
}

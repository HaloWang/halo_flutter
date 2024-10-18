import 'package:flutter/material.dart';
import 'package:halo/halo.dart';

void main() {
  _test();
  runApp(const MainApp());
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

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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

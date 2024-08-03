import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:halo/halo.dart';

void main() {
  final Map<String, String> map = {};
  final List<String> list = [];
  final ii = list.map((e) => e);
  final r = ii.getIndex(10);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

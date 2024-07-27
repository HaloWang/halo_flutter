import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:halo/halo.dart';

void main() {
  final q = null.listValue;
  final q1 = null.mapValue;
  final q3 = q.mv;
  if (kDebugMode) print("💬 ${q.runtimeType}");
  if (kDebugMode) print("💬 ${q1.runtimeType}");
  if (kDebugMode) print("💬 ${q3.runtimeType}");
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

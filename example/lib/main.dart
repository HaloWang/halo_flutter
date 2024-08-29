import 'package:flutter/material.dart';
import 'package:halo/halo.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ts0 = TextStyle();
    final ts1 = TS();
    final ts00 = ts0.cwc(kW);
    final ts10 = ts1.cwc(kW);

    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

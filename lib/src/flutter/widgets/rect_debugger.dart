import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:halo/halo.dart';

class RectDebugger extends StatefulWidget {
  const RectDebugger({super.key, required this.child});

  final Widget child;

  @override
  State<RectDebugger> createState() => _RectDebuggerState();
}

class _RectDebuggerState extends State<RectDebugger> {
  Timer? _timer;

  static const colors = [
    Color(0xFFAA0000),
    Color(0xFF00AA00),
    Color(0xFF0000AA),
    Color(0xFFAA00AA),
    Color(0xFF000000),
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: HF.randomInt(min: 500, max: 1500)), (timer) {
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!kDebugMode) return widget.child;

    final frameColor = colors[HF.randomInt(min: 0, max: colors.length - 1)].wo(0.5);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: frameColor, width: 0.5),
      ),
      child: widget.child,
    );
  }
}

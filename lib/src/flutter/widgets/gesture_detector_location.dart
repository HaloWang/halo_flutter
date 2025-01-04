import 'package:flutter/material.dart';
import 'package:halo/src/flutter/get_position.dart';

class GestureDetectorLocation extends StatelessWidget {
  final Widget child;
  final bool enabled;
  final dynamic Function(Offset)? onTap;
  final dynamic Function(Offset)? onLongPress;

  const GestureDetectorLocation({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!enabled) return child;

    final tapKey = GlobalKey();
    final onTap = this.onTap;
    final onLongPress = this.onLongPress;

    return GestureDetector(
      key: tapKey,
      onTap: onTap == null
          ? null
          : () {
              final position = getPosition(tapKey);
              onTap.call(position);
            },
      onLongPress: onLongPress == null
          ? null
          : () {
              final position = getPosition(tapKey);
              onLongPress.call(position);
            },
      child: child,
    );
  }
}

import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  final BorderRadiusGeometry borderRadius;
  final BorderSide side;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? hoverBackgroundColor;
  final Color? hoverForegroundColor;
  final EdgeInsetsGeometry? innerPadding;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final bool useContinuousRectangleBorder;
  final double? elevation;
  final void Function()? onTap;
  final void Function(bool)? onHover;

  const Splash({
    this.borderRadius = BorderRadius.zero,
    this.onTap,
    super.key,
    this.child,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.innerPadding,
    this.padding,
    this.onHover,
    this.useContinuousRectangleBorder = true,
    this.side = BorderSide.none,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      onHover: onHover,
      style: ButtonStyle(
        elevation: WidgetStatePropertyAll(elevation),
        padding: WidgetStatePropertyAll(padding),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return hoverForegroundColor ?? foregroundColor;
          }
          return foregroundColor;
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return hoverBackgroundColor ?? backgroundColor;
          }
          return backgroundColor;
        }),
        shape: WidgetStatePropertyAll(useContinuousRectangleBorder
            ? ContinuousRectangleBorder(
                borderRadius: borderRadius,
                side: side,
              )
            : RoundedRectangleBorder(
                borderRadius: borderRadius,
                side: side,
              )),
      ),
      child: innerPadding != null
          ? Padding(
              padding: innerPadding!,
              child: child,
            )
          : child,
    );
  }
}

import 'package:flutter/material.dart';

/// https://api.flutter.dev/flutter/painting/OutlinedBorder-class.html
enum BorderShapeType {
  continuousRectangleBorder,
  roundedRectangleBorder,
  circleBorder,
}

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
  final InteractiveInkFeatureFactory? splashFactory;

  @Deprecated("Use borderShapeType instead")
  final bool useContinuousRectangleBorder;

  final BorderShapeType borderShapeType;

  final double? elevation;
  final void Function()? onTap;
  final void Function(bool)? onHover;
  final Size? fixedSize;
  final Size? maximumSize;
  final Size? minimumSize;

  const Splash({
    super.key,
    this.backgroundColor,
    this.borderRadius = BorderRadius.zero,
    this.borderShapeType = BorderShapeType.continuousRectangleBorder,
    this.child,
    this.elevation,
    this.fixedSize,
    this.maximumSize,
    this.minimumSize,
    this.foregroundColor,
    this.hoverBackgroundColor,
    this.hoverForegroundColor,
    this.innerPadding,
    this.onHover,
    this.onTap,
    this.padding = EdgeInsets.zero,
    this.side = BorderSide.none,
    this.useContinuousRectangleBorder = true,
    this.splashFactory = InkSplash.splashFactory,
  });

  @override
  Widget build(BuildContext context) {
    late final MaterialStateProperty<OutlinedBorder?>? shape;

    switch (borderShapeType) {
      case BorderShapeType.continuousRectangleBorder:
        shape = MaterialStatePropertyAll(
          ContinuousRectangleBorder(
            borderRadius: borderRadius,
            side: side,
          ),
        );
      case BorderShapeType.roundedRectangleBorder:
        shape = MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: side,
          ),
        );
      case BorderShapeType.circleBorder:
        shape = MaterialStatePropertyAll(
          BeveledRectangleBorder(
            borderRadius: borderRadius,
            side: side,
          ),
        );
    }

    final _fixedSize = fixedSize != null ? MaterialStatePropertyAll(fixedSize) : null;
    final _maximumSize = maximumSize != null ? MaterialStatePropertyAll(maximumSize) : _fixedSize;
    final _minimumSize = minimumSize != null ? MaterialStatePropertyAll(minimumSize) : _fixedSize;

    return ElevatedButton(
      onPressed: onTap,
      onHover: onHover,
      style: ButtonStyle(
        splashFactory: splashFactory,
        fixedSize: _fixedSize,
        maximumSize: _maximumSize,
        minimumSize: _minimumSize,
        elevation: MaterialStatePropertyAll(elevation),
        padding: MaterialStatePropertyAll(padding),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return hoverForegroundColor ?? foregroundColor;
          }
          return foregroundColor;
        }),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return hoverBackgroundColor ?? backgroundColor;
          }
          return backgroundColor;
        }),
        shape: shape,
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

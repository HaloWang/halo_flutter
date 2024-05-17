import 'package:flutter/material.dart';
import 'package:halo/halo.dart';

class CRBSD extends ShapeDecoration {
  CRBSD({
    BorderRadiusGeometry? borderRadius,
    Color? borderColor,
    double? borderWidth,
    super.color,
    super.gradient,
    super.shadows,
    double strokeAlign = BorderSide.strokeAlignInside,
  }) : super(
          shape: ContinuousRectangleBorder(
            borderRadius: borderRadius ?? 12.r,
            side: (borderColor != null || borderWidth != null)
                ? BorderSide(
                    color: borderColor ?? const Color(0xFF000000),
                    width: borderWidth ?? 0.5,
                    style: BorderStyle.solid,
                    strokeAlign: strokeAlign,
                  )
                : BorderSide.none,
          ),
        );
}

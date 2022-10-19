import 'package:cater_me_v2/utils/effect/custom_paint.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyTab extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final Color activeBackgroundColor;
  final Color activeForegroundColor;
  final double fontSize;
  final bool active;
  final bool reversed;
  final String label;
  final VoidCallback onTap;

  Color get bgColor =>
      active ? activeBackgroundColor ?? foregroundColor : backgroundColor;
  Color get fgColor =>
      active ? activeForegroundColor ?? backgroundColor : foregroundColor;

  const MyTab({
   required this.active,
    this.reversed = false,
    required  this.label,
    required this.backgroundColor,
    required   this.foregroundColor,
    required   this.activeBackgroundColor,
    required  this.activeForegroundColor,
    required this.fontSize,
    required  this.onTap,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: IgnorePointer(
            child: reversed
                ? Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: CustomPaint(painter: TabPainter(color: bgColor)),
            )
                : CustomPaint(painter: TabPainter(color: bgColor)),
          ),
        ),
        Align(
          alignment: reversed ? Alignment.centerRight : Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: .5,
            heightFactor: 1,
            child: TextButton(
              onPressed: active ? null : onTap,
              child: Text(
                label,
                style: TextStyle(color: fgColor, fontSize: fontSize),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
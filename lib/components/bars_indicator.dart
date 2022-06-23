import 'package:flutter/material.dart';

class BarIndicator extends StatelessWidget {
  const BarIndicator(
      {Key? key,
      required this.barIndicator,
      required this.index,
      required this.width,
      required this.height,
      this.radius,
      this.activeColor,
      this.inactiveColor,
      this.child,
      this.borderColor})
      : super(key: key);

  final int barIndicator;
  final int index;
  final double width;
  final double height;
  final double? radius;
  final Color? activeColor;
  final Color? inactiveColor;
  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor ?? Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(radius ?? 0),
        color: barIndicator == index ? activeColor : inactiveColor,
      ),
      child: child,
    );
  }
}

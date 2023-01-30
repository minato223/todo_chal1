// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_chal1/constants/app_sizes.dart';

enum FadeAnimationDirection { top, right, bottom, left }

class FadeSlideAnimation extends StatefulWidget {
  Duration? duration;
  double? space;
  FadeAnimationDirection direction;
  Widget child;
  FadeSlideAnimation(
      {super.key, required this.child, this.duration, required this.direction});

  @override
  State<FadeSlideAnimation> createState() => _FadeSlideAnimationState();
}

class _FadeSlideAnimationState extends State<FadeSlideAnimation> {
  late Duration _duration;
  @override
  void initState() {
    super.initState();
    _duration = widget.duration ?? const Duration(milliseconds: 500);
  }

  Offset getOffset(double space, double value) {
    double ratio = (space * (value - 1) * (-1));
    switch (widget.direction) {
      case FadeAnimationDirection.top:
        return Offset(0, -ratio);
      case FadeAnimationDirection.left:
        return Offset(-ratio, 0);
      case FadeAnimationDirection.bottom:
        return Offset(0, ratio);
      case FadeAnimationDirection.right:
        return Offset(ratio, 0);
      default:
        return Offset.zero;
    }
  }

  @override
  Widget build(BuildContext context) {
    AppSizes size = AppSizes(context);
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: _duration,
        builder: ((context, value, child) {
          return Transform.translate(
            offset: getOffset(size.CONTENT_SPACE, value),
            // padding: getPadding(size.CONTENT_SPACE, value),
            child: Opacity(opacity: value, child: widget.child),
          );
        }));
  }
}

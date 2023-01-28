// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_chal1/constant/app_colors.dart';
import 'package:todo_chal1/constant/app_sizes.dart';

class CustomCircleAvatar extends StatelessWidget {
  Widget? child;
  bool withShadow;
  double? radius;
  CustomCircleAvatar(
      {super.key, this.child, this.withShadow = false, this.radius});

  @override
  Widget build(BuildContext context) {
    AppSizes size = AppSizes(context);
    ThemeData theme = Theme.of(context);
    double ratio = radius ?? size.AVATAR_RADIUS;
    return Container(
      width: ratio,
      height: ratio,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: theme.shadowColor,
          boxShadow: withShadow
              ? [
                  BoxShadow(
                      color: theme.shadowColor,
                      offset: const Offset(0, 7),
                      spreadRadius: 1,
                      blurRadius: 10)
                ]
              : null),
      child: child,
    );
  }
}

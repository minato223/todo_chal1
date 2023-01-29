// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_chal1/constants/app_sizes.dart';

class CustomCircleAvatar extends StatelessWidget {
  Widget? child;
  double? radius;
  CustomCircleAvatar({super.key, this.child, this.radius});

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
      ),
      child: child,
    );
  }
}

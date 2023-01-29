// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_chal1/constants/app_sizes.dart';

class CustomButton extends StatelessWidget {
  Color? borderColor;
  Color? textColor;
  Color? backgroundColor;
  String? text;
  void Function()? onClick;
  CustomButton(
      {super.key,
      this.borderColor,
      this.text,
      this.textColor,
      this.backgroundColor,
      this.onClick});

  @override
  Widget build(BuildContext context) {
    AppSizes size = AppSizes(context);
    ThemeData themeData = Theme.of(context);
    return InkWell(
      onTap: onClick,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            vertical: size.CONTENT_SPACE, horizontal: size.CONTENT_SPACE * .7),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 3,
                color: borderColor ?? backgroundColor ?? Colors.white)),
        child: Text(text ?? 'Click Me',
            style: themeData.textTheme.subtitle1!.copyWith(color: textColor)),
      ),
    );
  }
}

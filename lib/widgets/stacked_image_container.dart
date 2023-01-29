// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_chal1/constant/app_sizes.dart';
import 'package:todo_chal1/widgets/xspace.dart';

class StackedImageContainer extends StatelessWidget {
  List<String> avatars;
  Color? textColor;
  Color? backgroundColor;
  StackedImageContainer(
      {super.key, required this.avatars, this.textColor, this.backgroundColor});
  @override
  Widget build(BuildContext context) {
    AppSizes size = AppSizes(context);
    ThemeData themeData = Theme.of(context);
    const int ceil = 3;
    int rest = avatars.length - ceil;
    List.generate(2, ((index) => index));
    if (rest <= 0) {
      return renderStack(avatars);
    }
    var copy = [...avatars];
    copy.removeRange(ceil, copy.length);
    return Row(
      children: [
        renderStack(copy),
        XSpace((.2 * (size.AVATAR_RADIUS / 2)) * ceil).x,
        SizedBox(
          child: Text(
            "+",
            overflow: TextOverflow.ellipsis,
            style: themeData.textTheme.subtitle1!
                .copyWith(fontWeight: FontWeight.w500, color: backgroundColor),
          ),
        ),
        XSpace((.2 * (size.AVATAR_RADIUS / 2))).x,
        Container(
          width: size.AVATAR_RADIUS / 2,
          height: size.AVATAR_RADIUS / 2,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              rest.toString(),
              overflow: TextOverflow.ellipsis,
              style: themeData.textTheme.subtitle1!
                  .copyWith(fontWeight: FontWeight.w800, color: textColor),
            ),
          ),
        )
      ],
    );
  }

  Widget renderStack(List<String> images) {
    return Builder(builder: (context) {
      AppSizes size = AppSizes(context);
      return Row(
        children: images.reversed
            .map((avatar) => Align(
                  widthFactor: .7,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: size.AVATAR_RADIUS / 2,
                    height: size.AVATAR_RADIUS / 2,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover, image: AssetImage(avatar))),
                  ),
                ))
            .toList()
            .reversed
            .toList(),
      );
    });
  }
}

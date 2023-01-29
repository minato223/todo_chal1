// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_chal1/constants/app_colors.dart';
import 'package:todo_chal1/constants/app_sizes.dart';
import 'package:todo_chal1/views/home/models/task_model.dart';
import 'package:todo_chal1/widgets/stacked_image_container.dart';
import 'package:todo_chal1/widgets/xspace.dart';

class TaskCard extends StatelessWidget {
  TaskModel item;
  TaskCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final statusColorCallback = getStatusColorCallBack(context);
    AppSizes size = AppSizes(context);
    return Container(
      margin: EdgeInsets.only(bottom: size.CONTENT_SPACE),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.startTime,
            style: themeData.textTheme.subtitle1,
          ),
          XSpace(size.CONTENT_SPACE).x,
          Expanded(
              child: Container(
            padding: EdgeInsets.all(size.CONTENT_SPACE),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: statusColorCallback(item.status)["background"]),
            child: IntrinsicHeight(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: themeData.textTheme.subtitle1!.copyWith(
                      color: statusColorCallback(item.status)["text"],
                      fontWeight: FontWeight.w800),
                ),
                XSpace(size.CONTENT_SPACE * .2).y,
                Text(
                  item.subtitle,
                  style: themeData.textTheme.subtitle2!.copyWith(
                      color: statusColorCallback(item.status)["text"]),
                ),
                XSpace(size.CONTENT_SPACE * 1.5).y,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    StackedImageContainer(
                      avatars: item.avatars ?? [],
                      textColor: statusColorCallback(item.status)["text"],
                      backgroundColor: statusColorCallback(item.status)["text"]!
                          .withOpacity(.3),
                    ),
                    Expanded(
                      child: Text(
                        item.duration,
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: themeData.textTheme.subtitle2!.copyWith(
                            color: statusColorCallback(item.status)["text"]!
                                .withOpacity(.4),
                            fontWeight: FontWeight.bold,
                            fontSize:
                                themeData.textTheme.subtitle2!.fontSize! - 2),
                      ),
                    )
                  ],
                )
              ],
            )),
          ))
        ],
      ),
    );
  }

  Map<String, Color> Function(bool) getStatusColorCallBack(
      BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Color trueStatusTextColor = themeData.primaryColor;

    Map<String, Color> getStatusColor(bool status) {
      Map<String, Color> colors = {};
      colors["text"] =
          status ? trueStatusTextColor : AppColors.cardFalseStatusTextColor;
      colors["background"] = status
          ? AppColors.cardTrueStatusBackgroundColor
          : AppColors.cardFalseStatusBackgroundColor;
      return colors;
    }

    return getStatusColor;
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_chal1/constants/app_colors.dart';
import 'package:todo_chal1/constants/app_sizes.dart';
import 'package:todo_chal1/views/home/models/progress_model.dart';
import 'package:todo_chal1/widgets/xspace.dart';

class ProgressCard extends StatelessWidget {
  bool enabled;
  ProgressModel item;
  ProgressCard({super.key, required this.enabled, required this.item});

  @override
  Widget build(BuildContext context) {
    AppSizes size = AppSizes(context);
    ThemeData themeData = Theme.of(context);
    bool isDanger = item.progression < (ProgressModel.progressMax / 2);
    int getProgress() {
      return 100 * item.progression ~/ ProgressModel.progressMax;
    }

    String getSpinnerText() {
      if (isDanger) {
        return "${item.progression.toInt()}/${ProgressModel.progressMax}";
      }
      return "${getProgress()}%";
    }

    return TweenAnimationBuilder(
        curve: Curves.ease,
        tween: Tween<double>(begin: 0, end: enabled ? -size.CONTENT_SPACE : 0),
        duration: const Duration(milliseconds: 300),
        builder: ((context, value, child) {
          return Transform.translate(
            offset: Offset(0, value),
            child: Container(
              width: size.CARD_WIDTH,
              padding: EdgeInsets.all(size.CONTENT_SPACE),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: getProgressCardColor(isDanger)["background"],
                  boxShadow: [
                    BoxShadow(
                        color: getProgressCardColor(isDanger)["background"]!
                            .withOpacity(.4),
                        offset: const Offset(10, 10),
                        blurRadius: 10,
                        spreadRadius: 1)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: size.CONTENT_SPACE / 2),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: size.SPINNER_RATIO,
                          width: size.SPINNER_RATIO,
                          child: CircularProgressIndicator(
                            value: getProgress() / 100,
                            backgroundColor:
                                getProgressCardColor(isDanger)["background"],
                            color: getProgressCardColor(isDanger)["text"]!
                                .withOpacity(.7),
                            strokeWidth: 6,
                          ),
                        ),
                        Text(
                          getSpinnerText(),
                          style: themeData.textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: isDanger
                                  ? (themeData.textTheme.titleLarge!.fontSize! -
                                      5)
                                  : null,
                              color: getProgressCardColor(isDanger)["text"]),
                        )
                      ],
                    ),
                  ),
                  Expanded(child: XSpace(0).x),
                  Text(
                    item.title,
                    style: themeData.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w800,
                        color: getProgressCardColor(isDanger)["text"]),
                  ),
                  XSpace(size.CONTENT_SPACE / 3).y,
                  Text(
                    item.subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: themeData.textTheme.titleSmall!.copyWith(
                        color: getProgressCardColor(isDanger)["text"]!
                            .withOpacity(.6)),
                  )
                ],
              ),
            ),
          );
        }));
  }

  Map<String, Color> getProgressCardColor(bool isFirst) {
    Map<String, Color> colors = {};
    colors["text"] = isFirst
        ? AppColors.progressPrimaryTextColor
        : AppColors.progressSecondaryTextColor;
    colors["background"] = isFirst
        ? AppColors.progressPrimaryBackgroundColor
        : AppColors.progressSecondaryBackgroundColor;
    return colors;
  }
}

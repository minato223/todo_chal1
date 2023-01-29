import 'package:flutter/material.dart';
import 'package:todo_chal1/constants/app_colors.dart';
import 'package:todo_chal1/constants/app_images.dart';
import 'package:todo_chal1/constants/app_sizes.dart';
import 'package:todo_chal1/widgets/custom_button.dart';
import 'package:todo_chal1/widgets/xspace.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    AppSizes size = AppSizes(context);
    closePopup() {
      Navigator.pop(context);
    }

    return InkWell(
      onTap: () {
        closePopup();
      },
      child: Container(
        margin: EdgeInsets.all(size.CONTENT_SPACE),
        padding: EdgeInsets.all(size.CONTENT_SPACE * 1.5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(size.CONTENT_SPACE * .5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: themeData.textTheme.headline6!.color!
                            .withOpacity(.2)),
                    child: Icon(
                      Icons.close_rounded,
                      color: themeData.textTheme.headline6!.color,
                    ),
                  ),
                )),
            XSpace(size.CONTENT_SPACE / 2).y,
            Image.asset(AppImages.food),
            XSpace(size.CONTENT_SPACE).y,
            Text(
              "Oh, you need\nsome rest!",
              textAlign: TextAlign.center,
              style: themeData.textTheme.headline6!,
            ),
            XSpace(size.CONTENT_SPACE / 2).y,
            Expanded(
              child: SizedBox(
                width: size.WIDTH * .7,
                child: Text(
                  "Coffee machine can make a cappuccino especially for you in 5 minutes. Do you want some coffee?",
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: themeData.textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: themeData.textTheme.headline6!.color!
                          .withOpacity(.6)),
                ),
              ),
            ),
            XSpace(size.CONTENT_SPACE * 2).y,
            SizedBox(
              // height: size.WIDTH * .5,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      text: "No, later",
                      borderColor: themeData.textTheme.headline6!.color,
                      onClick: closePopup,
                    ),
                  ),
                  XSpace(size.CONTENT_SPACE).x,
                  Flexible(
                    flex: 2,
                    child: CustomButton(
                      text: "Yes, thanks!",
                      textColor: AppColors.progressSecondaryTextColor,
                      backgroundColor:
                          AppColors.progressSecondaryBackgroundColor,
                      onClick: closePopup,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

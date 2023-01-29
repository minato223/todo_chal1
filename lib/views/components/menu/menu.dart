import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:todo_chal1/constant/app_images.dart';
import 'package:todo_chal1/constant/app_sizes.dart';
import 'package:todo_chal1/widgets/custom_circle_avatar.dart';
import 'package:todo_chal1/widgets/stacked_image_container.dart';
import 'package:todo_chal1/widgets/xspace.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final ScrollController _scrollController = ScrollController();
  final List<String> avatars = [
    AppImages.avatar2,
    AppImages.avatar1,
    AppImages.avatar3,
    AppImages.avatar4
  ];
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      AppSizes size = AppSizes(context);
      _scrollController.addListener(() {
        double offset = (((_scrollController.offset + (size.CARD_WIDTH) / 2)) /
            ((size.CARD_WIDTH) + size.CONTENT_SPACE));
        if (offset.toInt() != currentIndex) {
          setState(() {
            currentIndex = offset.toInt();
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    AppSizes size = AppSizes(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: kToolbarHeight / 4,
            ),
          ),
          SliverAppBar(
            pinned: true,
            toolbarHeight: size.TOOLBAR_HEIGHT,
            backgroundColor: themeData.scaffoldBackgroundColor,
            title: Text('Hello, Minato', style: themeData.textTheme.headline3),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: size.CONTENT_SPACE),
                child: CustomCircleAvatar(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(AppImages.avatar1),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 0, horizontal: size.CONTENT_SPACE),
              child: Text(
                "Your progress",
                style: themeData.textTheme.headline6!,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: size.CARD_HEIGHT,
              margin: EdgeInsets.symmetric(vertical: size.CONTENT_SPACE),
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  controller: _scrollController,
                  padding: EdgeInsets.all(size.CONTENT_SPACE),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return TweenAnimationBuilder(
                        curve: Curves.ease,
                        tween: Tween<double>(
                            begin: 0,
                            end: index == currentIndex
                                ? -size.CONTENT_SPACE
                                : 0),
                        duration: const Duration(milliseconds: 300),
                        builder: ((context, value, child) {
                          return Transform.translate(
                            offset: Offset(0, value),
                            child: Container(
                              width: size.CARD_WIDTH,
                              padding: EdgeInsets.all(size.CONTENT_SPACE),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: getCardColor(index)["background"],
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            getCardColor(index)["background"]!
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
                                    padding: EdgeInsets.only(
                                        top: size.CONTENT_SPACE / 2),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        SizedBox(
                                          height: size.SPINNER_RATIO,
                                          width: size.SPINNER_RATIO,
                                          child: CircularProgressIndicator(
                                            value: .5,
                                            backgroundColor: getCardColor(
                                                index)["background"],
                                            color: getCardColor(index)["text"]!
                                                .withOpacity(.7),
                                            strokeWidth: 6,
                                          ),
                                        ),
                                        Text(
                                          "90%",
                                          style: themeData.textTheme.titleLarge!
                                              .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: getCardColor(
                                                      index)["text"]),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(child: XSpace(0).x),
                                  Text(
                                    "Working\nHours",
                                    style: themeData.textTheme.titleMedium!
                                        .copyWith(
                                            fontWeight: FontWeight.w800,
                                            color: getCardColor(index)["text"]),
                                  ),
                                  XSpace(size.CONTENT_SPACE / 3).y,
                                  Text(
                                    "Working hours exceeded by 3 hours",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: themeData.textTheme.titleSmall!
                                        .copyWith(
                                            color: getCardColor(index)["text"]!
                                                .withOpacity(.6)),
                                  )
                                ],
                              ),
                            ),
                          );
                        }));
                  },
                  separatorBuilder: (context, index) {
                    return XSpace(size.CONTENT_SPACE).x;
                  },
                  itemCount: 10),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.CONTENT_SPACE),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      "Wednesday, March 7",
                      overflow: TextOverflow.ellipsis,
                      style: themeData.textTheme.headline6!,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(size.CONTENT_SPACE * .5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: themeData.textTheme.headline6!.color!
                            .withOpacity(.2)),
                    child: Icon(
                      Icons.calendar_month_rounded,
                      color: themeData.textTheme.headline6!.color,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: XSpace(size.CONTENT_SPACE * 1.5).y),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.CONTENT_SPACE),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                    4, (index) => taskContainer(status: index % 2 != 0)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Map<String, Color> getCardColor(int index) {
    Color primaryTextColor = Colors.white;
    Color primaryBackgroundColor = const Color(0xfff56c61);
    Color secondaryTextColor = const Color(0xffa88024);
    Color secondaryBackgroundColor = const Color(0xffffd465);
    Map<String, Color> colors = {};
    colors["text"] = index == 0 ? primaryTextColor : secondaryTextColor;
    colors["background"] =
        index == 0 ? primaryBackgroundColor : secondaryBackgroundColor;
    return colors;
  }

  Function(bool) getStatusColorCallBack(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Color trueStatusTextColor = themeData.primaryColor;
    Color trueStatusBackgroundColor = const Color(0xffe7e5f1);
    Color falseStatusTextColor = const Color.fromARGB(255, 95, 20, 15);
    Color falseStatusBackgroundColor = const Color(0xfffee2e7);
    Map<String, Color> getStatusColor(bool status) {
      Map<String, Color> colors = {};
      colors["text"] = status ? trueStatusTextColor : falseStatusTextColor;
      colors["background"] =
          status ? trueStatusBackgroundColor : falseStatusBackgroundColor;
      return colors;
    }

    return getStatusColor;
  }

  Widget taskContainer({bool status = true}) {
    return Builder(builder: (context) {
      ThemeData themeData = Theme.of(context);
      final statusColorCallback = getStatusColorCallBack(context);
      AppSizes size = AppSizes(context);
      return Container(
        margin: EdgeInsets.only(bottom: size.CONTENT_SPACE),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "10:00 AM",
              style: themeData.textTheme.subtitle1,
            ),
            XSpace(size.CONTENT_SPACE).x,
            Expanded(
                child: Container(
              padding: EdgeInsets.all(size.CONTENT_SPACE),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: statusColorCallback(status)["background"]),
              child: IntrinsicHeight(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Meeting with front-end developers",
                    style: themeData.textTheme.subtitle1!.copyWith(
                        color: statusColorCallback(status)["text"],
                        fontWeight: FontWeight.w800),
                  ),
                  XSpace(size.CONTENT_SPACE * .2).y,
                  Text(
                    "Flose Real Estate project",
                    style: themeData.textTheme.subtitle2!
                        .copyWith(color: statusColorCallback(status)["text"]),
                  ),
                  XSpace(size.CONTENT_SPACE * 1.5).y,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      StackedImageContainer(
                        avatars: avatars,
                        textColor: statusColorCallback(status)["text"],
                        backgroundColor:
                            statusColorCallback(status)["text"].withOpacity(.3),
                      ),
                      Expanded(
                        child: Text(
                          "9:50 AM - 10:50 AM",
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                          style: themeData.textTheme.subtitle2!.copyWith(
                              color: statusColorCallback(status)["text"]
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
    });
  }
}

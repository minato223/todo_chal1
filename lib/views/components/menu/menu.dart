import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:todo_chal1/constant/app_images.dart';
import 'package:todo_chal1/constant/app_sizes.dart';
import 'package:todo_chal1/widgets/custom_circle_avatar.dart';
import 'package:todo_chal1/widgets/xspace.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final ScrollController _scrollController = ScrollController();
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      AppSizes size = AppSizes(context);
      _scrollController.addListener(() {
        double offset = (_scrollController.offset /
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
                style: themeData.textTheme.bodyText1!,
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
                                            fontWeight: FontWeight.w600,
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
          )
        ],
      ),
    );
  }

  Map<String, Color> getCardColor(int index) {
    // Color primaryTextColor = const Color(0xfffdc3bc);
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
}
// padding: EdgeInsets.symmetric(
//                       vertical: size.CONTENT_SPACE,
//                       horizontal: size.CONTENT_SPACE * 2),
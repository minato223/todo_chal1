import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:todo_chal1/constants/app_colors.dart';
import 'package:todo_chal1/constants/app_images.dart';
import 'package:todo_chal1/constants/app_sizes.dart';
import 'package:todo_chal1/fixtures/progress_fixture.dart';
import 'package:todo_chal1/fixtures/task_fixture.dart';
import 'package:todo_chal1/views/home/widgets/alert_widget.dart';
import 'package:todo_chal1/views/home/widgets/animated_progress_container.dart';
import 'package:todo_chal1/views/home/widgets/progress_card.dart';
import 'package:todo_chal1/views/home/widgets/task_card.dart';
import 'package:todo_chal1/widgets/custom_button.dart';
import 'package:todo_chal1/widgets/custom_circle_avatar.dart';
import 'package:todo_chal1/widgets/fade_slide_animation.dart';
import 'package:todo_chal1/widgets/xspace.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
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

  void showAlert() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isDismissible: false,
        builder: (context) {
          return const AlertWidget();
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
            title: Text('Hello, Minato!', style: themeData.textTheme.headline3),
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
              child: FadeSlideAnimation(
                  direction: FadeAnimationDirection.right,
                  child: Text(
                    "Your progress",
                    style: themeData.textTheme.headline6!,
                  )),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                height: size.CARD_HEIGHT,
                margin: EdgeInsets.symmetric(vertical: size.CONTENT_SPACE),
                child: const AnimatedProgressContainer()),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.CONTENT_SPACE),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: FadeSlideAnimation(
                      direction: FadeAnimationDirection.right,
                      duration: const Duration(milliseconds: 800),
                      child: Text(
                        "Wednesday, March 7",
                        overflow: TextOverflow.ellipsis,
                        style: themeData.textTheme.headline6!,
                      ),
                    ),
                  ),
                  FadeSlideAnimation(
                    direction: FadeAnimationDirection.right,
                    duration: const Duration(milliseconds: 800),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: themeData.textTheme.headline6!.color!
                              .withOpacity(.2)),
                      child: IconButton(
                          onPressed: () {
                            showAlert();
                          },
                          icon: Icon(
                            Icons.calendar_month_rounded,
                            color: themeData.textTheme.headline6!.color,
                          )),
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
                children: TaskFixture.tasks
                    .asMap()
                    .entries
                    .map((entry) => FadeSlideAnimation(
                        direction: FadeAnimationDirection.right,
                        duration: Duration(
                            milliseconds: (900 + ((1 + entry.key) * 100))),
                        child: TaskCard(item: entry.value)))
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

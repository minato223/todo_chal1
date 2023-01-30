import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:todo_chal1/constants/app_sizes.dart';
import 'package:todo_chal1/fixtures/progress_fixture.dart';
import 'package:todo_chal1/views/home/models/progress_model.dart';
import 'package:todo_chal1/views/home/widgets/progress_card.dart';

class AnimatedProgressContainer extends StatefulWidget {
  const AnimatedProgressContainer({super.key});

  @override
  State<AnimatedProgressContainer> createState() =>
      _AnimatedProgressContainerState();
}

class _AnimatedProgressContainerState extends State<AnimatedProgressContainer> {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();
  final ScrollController _scrollController = ScrollController();
  int currentIndex = 0;
  int animatedIndex = 0;
  bool animationEnded = false;
  startAnimation() {
    var f = Future(() {});
    for (var i = 0; i < ProgressFixture.tasks.length; i++) {
      ProgressModel model = ProgressFixture.tasks[i];
      f.then((value) {
        f = f.then((value) {
          return Future.delayed(const Duration(milliseconds: 200), (() {
            addTolist(model);
            if (i == ProgressFixture.tasks.length - 1) {
              setState(() {
                animationEnded = true;
              });
            }
          }));
        });
      });
    }
  }

  addTolist(ProgressModel model) {
    _key.currentState!.insertItem(animatedIndex);
    animatedIndex++;
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      startAnimation();
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
    AppSizes size = AppSizes(context);
    return AnimatedList(
      key: _key,
      physics: const BouncingScrollPhysics(),
      controller: _scrollController,
      padding: EdgeInsets.all(size.CONTENT_SPACE),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
            position: animation.drive(
                Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                    .chain(CurveTween(curve: Curves.ease))),
            child: ProgressCard(
              enabled: index == currentIndex && animationEnded,
              item: ProgressFixture.tasks[index],
              addRightMargin: index != ProgressFixture.tasks.length,
            ));
      },
      initialItemCount: animatedIndex,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_chal1/constants/app_colors.dart';
import 'package:todo_chal1/constants/app_sizes.dart';
import 'package:todo_chal1/views/components/menu/models/page_model.dart';
import 'package:todo_chal1/views/home/home.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int currentIndex = 0;
  final List<PageModel> pages = [
    PageModel(
        id: 1, iconData: Icons.cast_connected_rounded, page: const Home()),
    PageModel(id: 2, iconData: Icons.calendar_today, page: const Home()),
    PageModel(id: 3, iconData: Icons.calendar_month, page: const Home()),
    PageModel(id: 4, iconData: Icons.chat_sharp, page: const Home()),
    PageModel(id: 5, iconData: Icons.settings, page: const Home()),
  ];
  @override
  Widget build(BuildContext context) {
    AppSizes size = AppSizes(context);
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: PageView.builder(
          itemBuilder: (context, index) {
            return pages[currentIndex].page;
          },
          itemCount: pages.length),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(size.CONTENT_SPACE / 2),
        padding: EdgeInsets.symmetric(vertical: size.CONTENT_SPACE * .5),
        decoration: BoxDecoration(
            color: themeData.primaryColor,
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: pages
              .asMap()
              .entries
              .map((entry) => IconButton(
                  onPressed: () {
                    setState(() {
                      currentIndex = entry.key;
                    });
                  },
                  icon: Icon(
                    entry.value.iconData,
                    color: currentIndex == entry.key
                        ? Colors.white
                        : AppColors.inactiveIconColor,
                  )))
              .toList(),
        ),
      ),
    );
  }
}

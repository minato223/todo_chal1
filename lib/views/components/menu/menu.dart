import 'package:flutter/material.dart';
import 'package:todo_chal1/views/home/home.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int currentIndex = 0;
  final List<Widget> pages = [const Home()];
  @override
  Widget build(BuildContext context) {
    // AppSizes size = AppSizes(context);
    return Scaffold(
      body: PageView.builder(
          itemBuilder: (context, index) {
            return pages[currentIndex];
          },
          itemCount: pages.length),
    );
  }
}

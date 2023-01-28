import 'package:flutter/material.dart';
import 'package:todo_chal1/provider/theme_provider.dart';
import 'package:todo_chal1/views/components/menu/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeProvider.lightTheme,
      home: const Menu(),
    );
  }
}

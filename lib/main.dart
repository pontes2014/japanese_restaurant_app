import 'package:flutter/material.dart';
import 'package:japanese_restaurant_app/views/intro_page.dart';
import 'package:japanese_restaurant_app/views/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/menu_page': (context) => const MenuPage(),
      },
    );
  }
}

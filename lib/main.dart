import 'package:flutter/material.dart';
import 'package:japanese_restaurant_app/models/shop.dart';
import 'package:japanese_restaurant_app/views/cart_page.dart';
import 'package:japanese_restaurant_app/views/intro_page.dart';
import 'package:japanese_restaurant_app/views/menu_page.dart';
import 'package:japanese_restaurant_app/views/delivery_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => Shop(), child: const MyApp()));
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
        '/cart_page': (context) => const CartPage(),
        '/delivery_page': (context) => const DeliveryPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:japanese_restaurant_app/models/delivery.dart';
import 'package:japanese_restaurant_app/models/location.dart';
import 'package:japanese_restaurant_app/models/shop.dart';
import 'package:japanese_restaurant_app/views/cart_page.dart';
import 'package:japanese_restaurant_app/views/intro_page.dart';
import 'package:japanese_restaurant_app/views/menu_page.dart';
import 'package:japanese_restaurant_app/views/delivery_page.dart';
import 'package:japanese_restaurant_app/views/paynow.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Shop()),
        ChangeNotifierProvider(create: (_) => DeliveryData()),
        ChangeNotifierProvider(create: (_) => LocationController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        '/paynow_page': (context) => const PayNowPage(),
      },
    );
  }
}

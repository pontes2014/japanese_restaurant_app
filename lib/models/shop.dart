import 'package:flutter/material.dart';
import 'package:japanese_restaurant_app/models/food.dart';
import 'dart:convert';

class Shop extends ChangeNotifier {
  List<Food> _foodMenu = [];
  List<Food> _cart = [];

  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  Future<void> loadMenuFromJson(String jsonData) async {
    List<dynamic> jsonList = json.decode(jsonData);

    _foodMenu = jsonList.map((json) => Food.fromJson(json)).toList();

    notifyListeners();
  }

  void addToCartFromJson(Map<String, dynamic> json, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(Food.fromJson(json));
    }

    notifyListeners();
  }

  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}

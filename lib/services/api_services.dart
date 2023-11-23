import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'package:japanese_restaurant_app/models/food.dart';

class MockApiService {
  static Future<Map<String, dynamic>> getMockProducts() async {
    String jsonContent =
        await rootBundle.loadString('assets/json/mock_products.json');

    return json.decode(jsonContent);
  }

  static Future<ProductList> getMockProductsAsync() async {
    return ProductList.fromJson(await getMockProducts());
  }

  static Future<http.Response> getMockProductsHttpResponse() async {
    final mockProducts = await getMockProducts();
    final jsonData = jsonEncode(mockProducts);
    return http.Response(jsonData, 200);
  }
}

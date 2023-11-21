import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'package:japanese_restaurant_app/models/food.dart';

class MockApiService {
  static Future<List<Map<String, dynamic>>> getMockProducts() async {
    String jsonContent =
        await rootBundle.loadString('assets/json/mock_products.json');

    Map<String, dynamic> mockProducts = json.decode(jsonContent);

    return (mockProducts['produtos'] as List).cast<Map<String, dynamic>>();
  }

  static Future<ProductList> getMockProductsAsync() async {
    return ProductList.fromJsonList(await getMockProducts());
  }

  static Future<http.Response> getMockProductsHttpResponse() async {
    final mockProducts = await getMockProducts();
    final jsonData = jsonEncode({"produtos": mockProducts});
    return http.Response(jsonData, 200);
  }
}

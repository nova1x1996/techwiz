import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/product.dart'; // Thay đổi đường dẫn tới file Product.dart

class ListDataHomeProvider extends ChangeNotifier {
  List<Product> productList = [];

  Future<void> fetchProducts() async {
    final response = await http.get(
      Uri.parse("https://api.techwiz4.store/api/products/search?productType=PLANT&sortField=name&sortOrder=asc&offset=0&limit=5"),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Product> loadedProducts = [];
      for (var productData in data["content"]) {
        loadedProducts.add(Product.fromMap(productData));
      }
      productList = loadedProducts;
      notifyListeners();
    } else {
      throw Exception('Failed to load products');
    }
  }
}

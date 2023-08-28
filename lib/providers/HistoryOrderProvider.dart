import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/dto/bill/Order.dart';

class HistoryOrderProvider extends ChangeNotifier {
  final String apiFavoriteProduct = "https://api.techwiz4.store/api/billing/getBillingOfUser";

  Future<List<Order>> fetchOrders() async {
    try {
      final ref = await SharedPreferences.getInstance();
      final accessToken = ref.getString("accessToken");

      final response = await http.get(
        Uri.parse(apiFavoriteProduct),
        headers: {
          "Content-Type": "application/json;charset=UTF-8",
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        final dynamic responseData = json.decode(response.body);
        if (responseData is List<dynamic>) {
          print('bbbbbbbb');
          final List<Order> orders = [];
          
          for (final orderData in responseData) {
            print('aaaaa');
            if (orderData is Map<String, dynamic>) {
              print('cccccc');
              orders.add(Order.fromJson(orderData));
              print('dddd');
            }
          }
          return orders;
        } else {
          throw Exception('Invalid response data format');
        }
      } else {
        throw Exception('Failed to load orders');
      }
    } catch (error) {
      print('Error fetching orders: $error');
      rethrow;
    }
  }
}

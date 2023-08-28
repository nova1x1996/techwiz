import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class FeedbackProvider extends ChangeNotifier {

  String apiPostFeedback = "https://api.techwiz4.store/api/feedback"; // Thay thế bằng API endpoint của bạn

  Future<void> addFeedback(List<String> predefinedFeedbacks, String customFeedback) async {
    var ref = await SharedPreferences.getInstance();
    var accessToken = ref.getString("accessToken");

    List<String> allFeedbacks = List.from(predefinedFeedbacks);
    if (customFeedback.isNotEmpty) {
      allFeedbacks.add(customFeedback);
    }

    final response = await http.post(
      Uri.parse(apiPostFeedback),
      headers: {
        "Content-Type": "application/json;charset=UTF-8",
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode({
        "content": '$allFeedbacks' // Gộp tất cả các phản hồi thành một chuỗi, mỗi phản hồi cách nhau bằng dấu xuống dòng
      }),
    );

    if (response.statusCode == 200) {
      // Xử lý thành công nếu cần
    } else if (response.statusCode == 500) {
      final responseData = jsonDecode(response.body);
      final errorMessage = responseData['message'];
      throw Exception(errorMessage);
    } else if (response.statusCode == 409) {
      final responseData = jsonDecode(response.body);
      final errorMessage = responseData['message'];
      throw Exception(errorMessage);
    } else {
      // Xử lý các lỗi khác nếu cần
      print('Error sending feedback');
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
    }
  }
}

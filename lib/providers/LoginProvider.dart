import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/screens/Home/HomeMain.dart';
import '../constants/urlAPI.dart';
import '../services/LoginService.dart';
import 'package:provider/provider.dart';

class LoginProvider extends ChangeNotifier {
  bool _Loading = false;

  bool get Loading => _Loading;

  Future<void> setLoading(bool value) async {
    _Loading = value;

    notifyListeners();
  }

  Future<void> dangnhap(String mail, String pass, BuildContext context) async {
    setLoading(true);
    try {
      var respone = await http.post(
        Uri.parse(loginAPI),
        headers: {"Content-Type": "application/json;charset=UTF-8"},
        body: jsonEncode({
          "username": mail,
          "password": pass,
        }),
      );
      setLoading(false);
      if (respone.statusCode == 200) {
        var responeMap = json.decode(respone.body) as Map;
        var a = respone.body;
        var accessToken = responeMap["accessToken"];
        var refreshToken = responeMap["refreshToken"];

        Navigator.pushNamed(context, '/HomeMain');
      } else if (respone.statusCode == 404) {
        //Tài khoản hiện mật khẩu không tồn tại

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Vui lòng nhập đầy đủ tên đăng nhập và mật khẩu.'),
            duration: Duration(seconds: 2), // Đặt thời gian hiển thị
          ),
        );
        return;
        // return  showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return AlertDialog(
        //         title: Text('Thông báo'),
        //         content:
        //             Text('Vui lòng nhập đầy đủ tên đăng nhập và mật khẩu.'),
        //         actions: <Widget>[
        //           TextButton(
        //             child: Text('OK'),
        //             onPressed: () {
        //               Navigator.of(context).pop(); // Đóng hộp thoại
        //             },
        //           ),
        //         ],
        //       );
        //     });
      }
      setLoading(false);
    } catch (e) {
      setLoading(false);
      //Xuất hiện Popup " Đổi IP khác Wifi khác cho người dùngs"
      print(e);
    }
  }
}

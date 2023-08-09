import 'dart:convert';

import 'package:http/http.dart' as http;
import '../constants/urlAPI.dart';

class LoginService {

  LoginService();

  Future<void>  dangnhap(String mail,String pass) async{
    try {
      var respone = await http.post(
        Uri.parse(loginAPI),
        headers: {"Content-Type": "application/json;charset=UTF-8"},
        body: jsonEncode({
          "email": mail,
          "password": pass,
        }),
      );
      var responeMap = json.decode(respone.body) as Map;



    } catch (e) {
      print(e);
    }
  }

}
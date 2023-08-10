import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mobile_app/constants/urlAPI.dart';
import 'package:mobile_app/models/userRegister.dart';
import 'package:http/http.dart' as http;

class RegisterProvider extends ChangeNotifier{
bool _LoadingRegister = false;
get getLoading => _LoadingRegister;

Future<void> setLoading(bool value) async{
  _LoadingRegister = value;

  notifyListeners();
}


  Future<void> register(UserRegister newUser)async{
  // print(json.encode({
  //   "email": "Aaaa2222@gmail.com",
  //   "password": "Aaaa11222",
  //   "fullName": "aaaa",
  //   "username": "Aaaa2222",
  //   "gender": true,
  //   "phone": "0903922333",
  //   "dob": "2023-08-10T05:11:17.204Z",
  //   "address": "HCM"
  //
  // }));
  print(json.encode(newUser.toJson()));
      setLoading(true);
    try {
      var respone = await http.post(
        Uri.parse(registerAPI),
        headers: {"Content-Type": "application/json;charset=UTF-8"},
        body:json.encode(newUser.toJson())
      );

      if(respone.statusCode == 200){

        setLoading(false);
      }else if(respone.statusCode == 409){
        //Tên đăng nhập hoặc email đã tồn tại
        setLoading(false);
      }

    } catch (e) {
      setLoading(false);
      //Xuất hiện Popup " Đổi IP khác Wifi khác cho người dùngs"
      print(e);
    }
  }
}
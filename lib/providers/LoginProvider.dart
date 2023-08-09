

import 'package:flutter/material.dart';

import '../services/LoginService.dart';
import 'package:provider/provider.dart';
class LoginProvider extends ChangeNotifier{

  void DangNhap(String email,String pass){
      LoginService().dangnhap(email, pass);
  }
}
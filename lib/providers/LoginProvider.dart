import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/providers/AccountProvider.dart';
import 'package:mobile_app/screens/Home/HomeMain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/urlAPI.dart';
import '../services/LoginService.dart';
import 'package:provider/provider.dart';

import '../widgets/ExampleSnackbar.dart';

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
        var accessToken = responeMap["accessToken"];
        var refreshToken = responeMap["refreshToken"];
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('accessToken', accessToken);
        await prefs.setString('refreshToken', refreshToken);


       await Provider.of<AccountProvider>(context, listen: false)
            .getInforAccount();
        Navigator.pushNamed(context, '/Main');

      } else if (respone.statusCode == 404) {
        //Tài khoản hiện mật khẩu không tồn tại
        setLoading(false);
        SnackBarShowError(context,"Invalid password or username.");
        return;
      }
      setLoading(false);
    } catch (e) {
      setLoading(false);
      SnackBarShowError(context,"Switch to a different IP or a different WiFi");
      //Xuất hiện Popup " Đổi IP khác Wifi khác cho người dùngs"
      print(e);
    }
  }
  Future<void> dangnhapGoogle(String mail,String pass,BuildContext conext) async{
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    _googleSignIn.signIn().then((result){
      result?.authentication.then((googleKey){
        print(googleKey.accessToken);
        print(googleKey.idToken);
        print(_googleSignIn.currentUser?.displayName);
      }).catchError((err){
        print('inner error');
      });
    }).catchError((err){
      print('error occured');
    });
  }
}

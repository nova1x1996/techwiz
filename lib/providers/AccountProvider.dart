import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app/widgets/ExampleShowDialog.dart';
import 'package:mobile_app/widgets/ExampleSnackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/Account.dart';

class AccountProvider extends ChangeNotifier {
  late  Account account ;
String image = "";
String address = "";
  String _token = "";
String dob = "";
  bool gender = false;

  late int expiredTime;
  String get getToken => _token;
  late Timer bienTime;
  String ApiGetInforUser = "https://api.techwiz4.store/api/user/getUserInfo";


  Future<void> setgender(bool genderF) async{
    gender = genderF;
    notifyListeners();
  }

  Future<void> setDOB(String dobN) async{
    this.dob = dobN;
    notifyListeners();
  }
  Future<void> checkTokenFromPreferences() async {
    var ref = await SharedPreferences.getInstance();
    _token = ((ref.getString("accessToken") == null)
        ? ""
        : ref.getString("accessToken"))!;
    notifyListeners();
  }

  Future<bool> autoLogin() async {
    var ref = await SharedPreferences.getInstance();
    var a = ref.getString("accessToken");
    if (a == "" || a == null) {
      return false;
    } else {

      return true;
    }
  }

  Future<void> logOut(BuildContext context) async {
    _token = "";
    var ref = await SharedPreferences.getInstance();
    ref.remove("accessToken");

    notifyListeners();
    Navigator.pushNamedAndRemoveUntil(context, "/LoginMain", (route) => false);
  }

  Future<Account?> getInforAccount() async {
    var ref = await SharedPreferences.getInstance();

    var accessToken = ref.getString("accessToken");
    if (accessToken == null || accessToken == "") {
      return Future.error("Please Login To Continue !");
    }

    final response = await http.get(
      Uri.parse(ApiGetInforUser),
      headers: {
        'Authorization': 'Bearer $accessToken'
        // Header tùy chọn khác
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> aaa =
          jsonDecode(response.body) as Map<String, dynamic>;
      account = Account.fromMap(aaa);
      if(account.avatar != null){
       this.image = account.avatar!;
      }

    this.address = account.address;

      notifyListeners();
      return account;

    }
      return Future.error("Please Login To Continue !");


  }

  //Update Account "/InforAccount"
  Future<void> updateAccount({ required String fullName, required String? email,required String phone,
  required  bool gender, String? avatar,required String dob,required String address,required BuildContext context}) async {
    final String updateAPI = 'https://api.techwiz4.store/api/user/update'; // Đặt URL API cần cập nhật
    try{
      final response = await http.put(
        Uri.parse(updateAPI),
        headers: {"Content-Type": "application/json;charset=UTF-8",
          'Authorization': 'Bearer $_token'},
        body: jsonEncode({
          "fullName": fullName,
          "email": email,
          "phone": phone,
          "gender": gender,
          "avatar": avatar,
          "dob": dob,
          "address": address
        }),
      );
      var a = response.body;
      if(response.statusCode == 200) {
        ExampleShowDialogSuccess(context,"Update successful !");

        //  Navigator.popAndPushNamed(context, "/Main");

      }else{

      }
    }catch(error){
      ExampleShowDialogError(context,"Error");
      Navigator.pushNamed(context, "/Main");
    }



  }
  Future<void> updateImage(File _imageFile)async{
    var request = http.MultipartRequest('POST', Uri.parse("https://api.techwiz4.store/api/file/upload"));
    request.files.add(await http.MultipartFile.fromPath('file', _imageFile!.path));
    request.headers['Authorization'] = 'Bearer $_token';
    request.headers['Content-Type'] = 'image/png'; // Adjust this based on the actual image format.

    var response = await request.send();
    var responseBody = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      // Xử lý phản hồi từ máy chủ
      print('Upload thành công');
    } else {
      // Xử lý lỗi
      print('Upload thất bại');
    }
  }


}

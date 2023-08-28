import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_app/providers/AccountProvider.dart';
import 'package:mobile_app/widgets/ExampleSnackbar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../models/Account.dart';
import '../models/product.dart';


class FavoriteProvider extends ChangeNotifier {
  int currenPage = 0;
  int totalPage = 0;
  int limit = 4;
  bool loadingData = false;
  List<Product> listProduct = [];
  List<Product> listProductMore = [];
  List<Product> get getListProduct => [...listProduct];
  String apiFavoriteProduct = "https://api.techwiz4.store/api/favorites?sortField=name&sortOrder=asc";

  Future<List<Product>> getDSProduct() async {

    currenPage=0;
    listProduct=[];
    var ref = await SharedPreferences.getInstance();
    var accessToken = ref.getString("accessToken");
    final response = await http.get(
      Uri.parse(apiFavoriteProduct + "&offset=0&limit=$limit"),
      headers: {"Content-Type": "application/json;charset=UTF-8",
        'Authorization': 'Bearer $accessToken'},
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> aaa =
      jsonDecode(response.body) as Map<String, dynamic>;
      // account = Product.fromMap(aaa);
      var aaa1 =aaa["content"] as List ;
      var list = aaa1.map((e) =>
          Product.fromMap(e)
      ).toList();
      listProduct = list;
      // currenPage++;
      notifyListeners();
      return listProduct;
    } else {
      print('GET Request Failed');
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      return Future.error("sss");
    }
  }
  Future<List<Product>> getDSProductMore() async {
    final response = await http.get(
      Uri.parse(apiFavoriteProduct + "&offset=$currenPage&limit=$limit"),
    );
    var ref = await SharedPreferences.getInstance();
    var accessToken = ref.getString("accessToken");

    if (response.statusCode == 200) {
      Map<String, dynamic> aaa =
      jsonDecode(response.body) as Map<String, dynamic>;
      var aaa1 =aaa["content"] as List ;
      var list = aaa1.map((e) =>
          Product.fromMap(e)
      ).toList();

      print("--------${currenPage}");
      if(aaa["totalElements"] > listProduct.length) {
        listProduct.addAll(list);
        currenPage++;
      }
      // Thông báo cho Provider rằng dữ liệu đã thay đổi
      notifyListeners();

      return listProduct;
    } else {
      print('GET Request Failed');
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      return Future.error("sss");
    }
  }
  Future<void> removeProduct(String productId) async {
    await _simulateSomeAsyncOperation(); // Simulate some asynchronous operation

   listProduct.removeWhere((product) => product.id == productId);
    notifyListeners(); // Notify listeners to update the UI
  }

  Future<void> _simulateSomeAsyncOperation() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate an asynchronous operation
    // Replace this with your actual asynchronous logic
  }
  Future<List<Product>> getList(){
    return Future.value(listProduct);
  }
  Future<void> removeProductFromFavorite(String ProductID,BuildContext context)async{
    var ref = await SharedPreferences.getInstance();
    var accessToken = ref.getString("accessToken");


  Account? accountUser =   Provider.of<AccountProvider>(context,listen: false).account;

    if(accountUser == null || accountUser == ""){
  return         SnackBarShowError(context, "You cannot remove the product.");

    }
    String APIFavorite = "https://api.techwiz4.store/api/favorites";
    try {
      var respone = await http.delete(
        Uri.parse(APIFavorite),
        headers: {"Content-Type": "application/json;charset=UTF-8",
          'Authorization': 'Bearer $accessToken'},
        body: jsonEncode({
          "id": "",
          "userId": "",
          "productId": "$ProductID"
        }),

      );

      if (respone.statusCode == 200) {

        SnackBarShowSuccess(context, "You have successfully removed.");

      }

      SnackBarShowSuccess(context, "You can't remove favorites.!");
    } catch (e) {
      SnackBarShowSuccess(context, "You can't remove favorites.!");
      //Xuất hiện Popup " Đổi IP khác Wifi khác cho người dùngs"
      print(e);
    }
  }

  Future<void> addFavorite(BuildContext context,String productID)async{
    var ref = await SharedPreferences.getInstance();
    var accessToken = ref.getString("accessToken");

    String apiFavorite = "https://api.techwiz4.store/api/favorites";
    try {
      var respone = await http.post(
        Uri.parse(apiFavorite),
        headers: {"Content-Type": "application/json;charset=UTF-8",
          'Authorization': 'Bearer $accessToken'},
        body: jsonEncode({
          "productId": "$productID"
        }),

      );

      if (respone.statusCode == 200) {

      return SnackBarShowSuccess(context, "You have successfully added to favorites.!");

      }

      SnackBarShowSuccess(context, "You can't added to favorites.!");
    } catch (e) {
      SnackBarShowSuccess(context, "You can't added to favorites.!");
      //Xuất hiện Popup " Đổi IP khác Wifi khác cho người dùngs"
      print(e);
    }
  }
}
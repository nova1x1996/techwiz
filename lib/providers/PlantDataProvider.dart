import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/product.dart';



class PlantDataProvider extends ChangeNotifier {
  int currenPage = 0;
  int totalPage = 0;
  int limit = 4;
  bool loadingData = false;
  List<Product> listProduct = [];
  List<Product> listProductMore = [];
  List<Product> get getListProduct => [...listProduct];
  String apiGetProduct = "https://api.techwiz4.store/api/products/search?sortField=name&sortOrder=asc";


  Future<List<Product>> getDSProduct() async {
    currenPage=0;
    listProduct=[];
    var ref = await SharedPreferences.getInstance();
    var accessToken = ref.getString("accessToken");
    final response = await http.get(
      Uri.parse(apiGetProduct + "&offset=0&limit=$limit"),
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
      currenPage++;
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
      Uri.parse(apiGetProduct + "&offset=$currenPage&limit=$limit"),
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
Future<List<Product>> getList(){
    return Future.value(listProduct);
  }
}
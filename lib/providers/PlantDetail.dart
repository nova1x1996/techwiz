import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import '../models/ModelDetail.dart';

class PlantDetailProvider extends ChangeNotifier {
  late double price;
  late String size;
  late ProductDetail product ;

  Future<ProductDetail> getDetailProvider(String id) async {
    final String getDetailAPI =
        'https://api.techwiz4.store/api/products/$id'; // Đặt URL API cần cập nhật
    try {
      final response = await http.get(
        Uri.parse(getDetailAPI),
      );

      var a = response.body;
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print("Aaaa");
        ProductDetail productNew = ProductDetail.fromJson(responseData);
        this.product = productNew;
        //Lay gia nho nhat de hiens
        price = product.sizes[0].price;
        size = product.sizes[0].sizeName;
        return productNew;
        // ExampleShowDialogSuccess(context,"Update successful !");

        //  Navigator.popAndPushNamed(context, "/Main");
      } else {
        return Future.error("Error");
      }
    } catch (error) {
      // ExampleShowDialogError(context,"Error");
      //Navigator.pushNamed(context, "/Main");
      return Future.error("Error");
    }
  }


  Future<void> selectSize(int index) async{
   this.price = this.product.sizes[index].price;
  this.size = this.product.sizes[index].sizeName;

  // this.size =
  notifyListeners();
  }

}

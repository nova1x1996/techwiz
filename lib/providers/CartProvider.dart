import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile_app/models/dto/cart/OrderItem.dart';
import 'package:mobile_app/widgets/ExampleShowDialog.dart';
import 'package:mobile_app/widgets/ExampleSnackbar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../models/Account.dart';

class CartProvider extends ChangeNotifier {
  late String id;
  late int quantity = 0;
  late double totalMoney;
  List<OrderItem> listProduct = [];
  List<OrderItem> listProductMore = [];
  List<OrderItem> get getListProduct => [...listProduct];
  String apiGetCart = "https://api.techwiz4.store/api/cart/getCart";
  String apiUpdateCart = "https://api.techwiz4.store/api/cart/save";
  String apiDeletefromCart = "https://api.techwiz4.store/api/cart/delete";

  Future<void> CheckOutPayment(
      String PaymentType, Account account, BuildContext context) async {
    var ref = await SharedPreferences.getInstance();
    var accessToken = ref.getString("accessToken");
    String apiCheckout = "https://api.techwiz4.store/checkout";
    final response = await http.post(
      Uri.parse(apiCheckout),
      headers: {
        "Content-Type": "application/json;charset=UTF-8",
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode({
        "paymentMethod": '$PaymentType',
        "fullName": "${account.fullName}",
        "address": "${account.address}",
        "phoneNumber": "${account.phone}"
      }),
    );
    var a = response.body;
    if (response.statusCode == 200) {
      ExampleShowDialogSuccess(
          context, "You have successfully completed the payment.");
    } else if (response.statusCode == 400) {
      // Giải mã phản hồi JSON
      Map<String, dynamic> responseBody = json.decode(response.body);

      // Truy cập thông tin trong khối "errors"
      Map<String, dynamic> errors = responseBody['errors'];


      List error = [];
      List<OrderItem> productsWithSizeId2 = [];

      errors.forEach((key, value) {
        String errorCode = key;

        for (var product in listProduct) {
          if (product.product.plant != null) {
            if (product.product.plant!.size!.id == errorCode) {
              productsWithSizeId2.add(product);
            }
          } else if (product.product.accessory!.size!.id == errorCode) {
            productsWithSizeId2.add(product);
          }
        }

        String errorMessage = value['EXCEED_QUANTITY'];
        error.add(errorMessage);

        // In ra thông báo lỗi
        print('Error code: $errorCode, Message: $errorMessage');
      });
  var a = productsWithSizeId2;

String contentLoi = "";
  for(int i = 0 ; i < a.length; i++){
    if(a[i].product.plant != null ){
      contentLoi += "${a[i].product.plant!.name} -- ${error[i].toString() } \n";

    }else{
      contentLoi += "${a[i].product.accessory!.name} -- ${error[i].toString() } \n";

    }
  }



      // var product = listProduct.where((element) {
        //   if(element.product.accessory != null){
        //     return element.product.accessory.size.id ==
        //   }
        // }
        // );
      ExampleShowDialogError(context, "${contentLoi}");
    } else {
      ExampleShowDialogError(context, "You have failed to make the payment.");
    }
  }

  Future<void> GetCart() async {
    var ref = await SharedPreferences.getInstance();
    var accessToken = ref.getString("accessToken");
    if(accessToken == null || accessToken == ""){
       String id = "";
       quantity = 0;
    totalMoney = 0;
  listProduct = [];
    listProductMore = [];
    return;
    }
    final response = await http.get(
      Uri.parse(apiGetCart),
      headers: {
        "Content-Type": "application/json;charset=UTF-8",
        'Authorization': 'Bearer $accessToken'
      },
    );
    if (response.statusCode == 200) {
      List<OrderItem> orderItems = List<OrderItem>.from(
        jsonDecode(response.body).map((item) => OrderItem.fromJson(item)),
      );
      var sumQuantity = 0;
      double sumTotalMoney = 0;
      if(orderItems.length == 0){
        totalMoney = 0;
      }
      for (var item in orderItems) {
        sumQuantity = sumQuantity + item.quantity;
        if (item.product.productType == "PLANT") {
          sumTotalMoney =
              sumTotalMoney + (item.quantity * item.product.plant!.size!.price);
        } else {
          sumTotalMoney = sumTotalMoney +
              (item.quantity * item.product.accessory!.size!.price);
        }
        totalMoney = sumTotalMoney;
      }
      quantity = sumQuantity;

      listProduct = orderItems; // Update the listProduct here
      notifyListeners();
      return;
    } else {
      print('GET Request Failed');
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      return Future.error("sss");
    }
  }

  Future<void> addToCart(String idPD, bool status) async {
    var productItem;
    for (var item in listProduct) {
      if (item.product.plant != null) {
        if (item.product.plant!.size!.id == idPD) {
          productItem = item;
        }
      }
      if (item.product.accessory != null) {
        if (item.product.accessory!.size!.id == idPD) {
          productItem = item;
        }
      }
    }
    var ref = await SharedPreferences.getInstance();
    var accessToken = ref.getString("accessToken");

    int quantity = status ? productItem.quantity + 1 : productItem.quantity - 1;

    final response = await http.post(
      Uri.parse(apiUpdateCart),
      headers: {
        "Content-Type": "application/json;charset=UTF-8",
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode({
        "productSizeId": '$idPD',
        "quantity": '$quantity',
      }),
    );

    if (response.statusCode == 200) {
      GetCart();
    }
  }

  // void increaseQuantity(OrderItem item) {
  //   item.// Tăng số lượng sản phẩm
  //   notifyListeners(); // Thông báo thay đổi để cập nhật giao diện
  // }
  //
  // void decreaseQuantity(OrderItem item) {
  //   if (item.quantity > 1) {
  //     item.quantity--; // Decrement the quantity
  //     notifyListeners();
  //   }
  // }

  Future<void> deletefromCart(OrderItem item) async {
    var ref = await SharedPreferences.getInstance();
    var accessToken = ref.getString("accessToken");
    String? id = item.product.plant?.id ?? item.product.accessory?.id;

    final response = await http.post(
      Uri.parse(apiUpdateCart),
      headers: {
        "Content-Type": "application/json;charset=UTF-8",
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode({
        "productSizeId": '$id',
      }),
    );

    if (response.statusCode == 200) {
      listProduct.removeWhere((orderItem) =>
          orderItem.product.plant?.id == id ||
          orderItem.product.accessory?.id == id);
      notifyListeners();
    } else {
      // Handle error
      print('Error adding item to cart');
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
    }
  }

  int getTotalItemsFromCart() {
    return listProduct.length;
  }

  Future<void> addToCartOnlyID(String id,BuildContext context) async {
    bool flag = false;
    var ref = await SharedPreferences.getInstance();
    var accessToken = ref.getString("accessToken");
    var productItem;
    for (var item in listProduct) {
      if (item.product.plant != null) {
        if (item.product.plant!.size!.id == id) {
          productItem = item;
          flag = true;
        }
      }
      if (item.product.accessory != null) {
        if (item.product.accessory!.size!.id == id) {
          productItem = item;
          flag = true;
        }
      }
    }
    var soluong;
    if(flag == false){
   soluong = 0;
    }else{
       soluong = productItem.quantity;
    }


    final response = await http.post(
      Uri.parse(apiUpdateCart),
      headers: {
        "Content-Type": "application/json;charset=UTF-8",
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode({
        "productSizeId": '$id',
        "quantity": '${soluong + 1}',
      }),
    );
    if (response.statusCode == 200) {
       SnackBarShowSuccess(context, "You have successfully added to cart.");
    } else {
      // Handle error
      print('Error adding item to cart');
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
    }
    GetCart();
  }

  Future<List<OrderItem>> GetCartForCartDetail() async {
    var ref = await SharedPreferences.getInstance();
    var accessToken = ref.getString("accessToken");
    final response = await http.get(
      Uri.parse(apiGetCart),
      headers: {
        "Content-Type": "application/json;charset=UTF-8",
        'Authorization': 'Bearer $accessToken'
      },
    );
    if (response.statusCode == 200) {
      List<OrderItem> orderItems = List<OrderItem>.from(
        jsonDecode(response.body).map((item) => OrderItem.fromJson(item)),
      );
      var sum = 0;
      for (var item in orderItems) {
        sum = sum + item.quantity;
      }
      quantity = sum;
      listProduct = orderItems; // Update the listProduct here

      return listProduct;
    } else {
      print('GET Request Failed');
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      return Future.error("Error");
    }
  }

  // Future<void> GetTotalItem() async{
  //   var ref = await SharedPreferences.getInstance();
  //   var accessToken = ref.getString("accessToken");
  //   final response = await http.get(
  //     Uri.parse(apiGetCart),
  //     headers: {"Content-Type": "application/json;charset=UTF-8",
  //       'Authorization': 'Bearer $accessToken'},
  //   );
  //   if (response.statusCode == 200) {
  //     List<OrderItem> orderItems = List<OrderItem>.from(
  //       jsonDecode(response.body).map((item) => OrderItem.fromJson(item)),
  //     );
  //     print(orderItems[0].product.productType);
  //     int a = orderItems.l; // Update the listProduct here
  //     notifyListeners();
  //     return;
  //   } else {
  //     print('GET Request Failed');
  //     print('Response Status Code: ${response.statusCode}');
  //     print('Response Body: ${response.body}');
  //     return Future.error("sss");
  //   }
  // }
}

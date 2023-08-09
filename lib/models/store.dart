

import 'package:mobile_app/models/product.dart';

class Store {
  final String name;
  final String address;
  final String phone;
  final String openTime;
  final String? avatar;
  final String? background;
  final List<Product> products;

  Store({
    required this.name,
    required this.address,
    required this.phone,
    required this.openTime,
     this.avatar,
     this.background,
    required this.products,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    List<Product> products = (json['products'] as List)
        .map((item) => Product.fromMap(item))
        .toList();
    return Store(
      name: json['name'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      openTime: json['openTime'] as String,
      avatar: json['avatar'] as String,
      background: json['background'] as String,
      products: products,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'openTime': openTime,
      'avatar': avatar,
      'background': background,
      'products': products.map((product) => product.toMap()).toList(),
    };
  }

  // Thêm sản phẩm vào cửa hàng
  void addProduct(Product product) {
    products.add(product);
  }

  // Xoá sản phẩm khỏi cửa hàng
  void removeProduct(Product product) {
    products.remove(product);
  }

  // Lấy danh sách sản phẩm trong cửa hàng
  List<Product> getProducts() {
    return products;
  }
}

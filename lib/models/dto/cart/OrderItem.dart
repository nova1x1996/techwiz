import 'package:mobile_app/models/dto/cart/Product.dart';
import 'package:mobile_app/models/dto/cart/ProductInCart.dart';

class OrderItem {
  final String id;
  final ProductInCart product;
  final int quantity;

  OrderItem({
    required this.id,
    required this.product,
    required this.quantity,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      product: ProductInCart.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }
}

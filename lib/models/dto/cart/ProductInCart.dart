import 'Plant.dart';
import 'Accessory.dart';

class ProductInCart {
  final String productType;
  final Plant? plant;
  final Accessory? accessory;

  ProductInCart({
    required this.productType,
    this.plant,
    this.accessory,
  });

  factory ProductInCart.fromJson(Map<String, dynamic> json) {
    return ProductInCart(
      productType: json['productType'],
      plant: json['plant'] != null ? Plant. fromJson(json['plant']) : null,
      accessory: json['accessory'] != null ? Accessory.fromJson(json['accessory']) : null,
    );
  }
}

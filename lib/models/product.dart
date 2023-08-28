class Product {
  final String id;
  final String name;
  final double minPrice;
  final double? maxPrice;
  final int stockCount;
  final String productImage;
  final bool isFavorited;

  Product({
    required this.id,
    required this.name,
    required this.minPrice,
    required this.maxPrice,
    required this.stockCount,
    required this.productImage,
    required this.isFavorited,
  });

  // Phương thức chuyển từ Map sang Product
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: (map['id']) ,
      name: map['name'],
      minPrice: map['minPrice'],
      maxPrice: map['maxPrice'],
      stockCount: map['stockCount'],
      productImage: map['productImage'],
      isFavorited: map['isFavorited'],
    );
  }

  // Phương thức chuyển từ Product sang Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'minPrice': minPrice,
      'maxPrice': maxPrice,
      'stockCount': stockCount,
      'productImage': productImage,
      'isFavorited': isFavorited,
    };
  }
}

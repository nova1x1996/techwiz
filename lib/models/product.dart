class Product {
  final String name;
  final double price;
  final String image;

  Product({required this.name, required this.price, required this.image});

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] as String,
      price: map['price'] as double,
      image: map['image'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'image': image,
    };
  }
}

class Product {
  String? id;
  String? name;
  String? description;
  int? minPrice;
  int? maxPrice;
  int? stockCount;
  String? productImage;
  bool? isFavorited;


  Product({this.id, this.name, this.description, this.minPrice,this.maxPrice,this.stockCount,this.productImage,this.isFavorited});

  Product.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.name = json['name ='],
        this.description = json['description'],
        this.minPrice = json['minPrice'],
        this.maxPrice = json['maxPrice'],
        this.stockCount = json['stockCount'],
        this.productImage = json['productImage'],
        this.isFavorited = json['isFavorited'];
}
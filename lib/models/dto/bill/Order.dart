class Order {
  String? id;
  DateTime? orderDate;
  double? totalAmount;
  String? fullName;
  String? phone;
  String? address;
  String? paymentMethod;
  String? status;
  List<OrderItem>? orderItems;

  Order({
    this.id,
    this.orderDate,
    this.totalAmount,
    this.fullName,
    this.phone,
    this.address,
    this.paymentMethod,
    this.status,
    this.orderItems,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      orderDate: json['orderDate'] != null ? DateTime.parse(json['orderDate']) : null,
      totalAmount: json['totalAmount']?.toDouble(),
      fullName: json['fullName'],
      phone: json['phone'],
      address: json['address'],
      paymentMethod: json['paymentMethod'],
      status: json['status'],
      orderItems: (json['orderItems'] as List<dynamic>?)
          ?.map((itemData) => OrderItem.fromJson(itemData))
          .toList(),
    );
  }
}

class OrderItem {
  String? id;
  Product? product;
  int? quantity;
  double? rate;
  double? amount;

  OrderItem({
    this.id,
    this.product,
    this.quantity,
    this.rate,
    this.amount,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      product: json['product'] != null ? Product.fromJson(json['product']) : null,
      quantity: json['quantity'],
      rate: json['rate'],
      amount: json['amount'],
    );
  }
}

class Product {
  String? productType;
  Plant? plant;
  Accessory? accessory;

  Product({
    this.productType,
    this.plant,
    this.accessory,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productType: json['productType'],
      plant: json['plant'] != null ? Plant.fromJson(json['plant']) : null,
      accessory: json['accessory'] != null ? Accessory.fromJson(json['accessory']) : null,
    );
  }
}

class Plant {
  String? id;
  String? name;
  String? description;
  String? instruction;
  String? careLevel;
  bool? toxicity;
  DateTime? madeOnDate;
  List<ImageData>? images;
  Size? size;

  Plant({
    this.id,
    this.name,
    this.description,
    this.instruction,
    this.careLevel,
    this.toxicity,
    this.madeOnDate,
    this.images,
    this.size,
  });

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      instruction: json['instruction'],
      careLevel: json['careLevel'],
      toxicity: json['toxicity'],
      madeOnDate: json['madeOnDate'] != null ? DateTime.parse(json['madeOnDate']) : null,
      images: (json['images'] as List<dynamic>?)
          ?.map((img) => ImageData.fromJson(img))
          .toList(),
      size: json['size'] != null ? Size.fromJson(json['size']) : null,
    );
  }
}

class Accessory {
  String? id;
  String? name;
  String? description;
  String? instruction;
  TypeData? type;
  List<ImageData>? images;
  Size? size;

  Accessory({
    this.id,
    this.name,
    this.description,
    this.instruction,
    this.type,
    this.images,
    this.size,
  });

  factory Accessory.fromJson(Map<String, dynamic> json) {
    return Accessory(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      instruction: json['instruction'],
      type: json['type'] != null ? TypeData.fromJson(json['type']) : null,
      images: (json['images'] as List<dynamic>?)
          ?.map((img) => ImageData.fromJson(img))
          .toList(),
      size: json['size'] != null ? Size.fromJson(json['size']) : null,
    );
  }
}

class TypeData {
  String? id;
  String? name;
  String? description;
  String? fatherTypeId;
  List<String>? childTypes;

  TypeData({
    this.id,
    this.name,
    this.description,
    this.fatherTypeId,
    this.childTypes,
  });

  factory TypeData.fromJson(Map<String, dynamic> json) {
    return TypeData(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      fatherTypeId: json['fatherTypeId'],
      childTypes: json['childTypes'] != null
          ? List<String>.from(json['childTypes'])
          : null,
    );
  }
}

class ImageData {
  String? id;
  String? image;
  bool? thumbnail;
  bool? deleted;

  ImageData({
    this.id,
    this.image,
    this.thumbnail,
    this.deleted,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      id: json['id'],
      image: json['image'],
      thumbnail: json['thumbnail'],
      deleted: json['deleted'],
    );
  }
}

class Size {
  String? id;
  int? width;
  int? height;
  DateTime? madeOnDate;
  double? price;
  String? type;
  String? size;
  String? sizeId;
  String? stockId;
  int? quantity;

  Size({
    this.id,
    this.width,
    this.height,
    this.madeOnDate,
    this.price,
    this.type,
    this.size,
    this.sizeId,
    this.stockId,
    this.quantity,
  });

  factory Size.fromJson(Map<String, dynamic> json) {
    return Size(
      id: json['id'],
      width: json['width'],
      height: json['height'],
      madeOnDate: json['madeOnDate'] != null ? DateTime.parse(json['madeOnDate']) : null,
      price: json['price']?.toDouble(),
      type: json['type'],
      size: json['size'],
      sizeId: json['sizeId'],
      stockId: json['stockId'],
      quantity: json['quantity'],
    );
  }
}

class Accessory {
  final String id;
  final String name;
  final String description;
  final String? instruction;
  final AccessoryType? type;
  final List<AccessoryImage> images;
  final AccessorySize size;

  Accessory({
    required this.id,
    required this.name,
    required this.description,
     this.instruction,
     this.type,
    required this.images,
    required this.size,
  });

  factory Accessory.fromJson(Map<String, dynamic> json) {
    return Accessory(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      instruction: json['instruction'],
      type: AccessoryType.fromJson(json['type']),
      images: (json['images'] as List).map((imageJson) => AccessoryImage.fromJson(imageJson)).toList(),
      size: AccessorySize.fromJson(json['size']),
    );
  }
}

class AccessoryImage {
  final String id;
  final String image;
  final bool deleted;
  final bool thumbnail;

  AccessoryImage({
    required this.id,
    required this.image,
    required this.deleted,
    required this.thumbnail,
  });

  factory AccessoryImage.fromJson(Map<String, dynamic> json) {
    return AccessoryImage(
      id: json['id'],
      image: json['image'],
      deleted: json['deleted'],
      thumbnail: json['thumbnail'],
    );
  }
}

class AccessoryType {
  final String id;
  final String name;
  final String description;

  AccessoryType({
    required this.id,
    required this.name,
    required this.description,
  });

  factory AccessoryType.fromJson(Map<String, dynamic> json) {
    return AccessoryType(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}

class AccessorySize {
  final String id;
  final double width;
  final double height;
  final String madeOnDate;
  final double price;
  final String type;
  final String size;
  final String sizeId;
  final String stockId;
  final int quantity;

  AccessorySize({
    required this.id,
    required this.width,
    required this.height,
    required this.madeOnDate,
    required this.price,
    required this.type,
    required this.size,
    required this.sizeId,
    required this.stockId,
    required this.quantity,
  });

  factory AccessorySize.fromJson(Map<String, dynamic> json) {
    return AccessorySize(
      id: json['id'],
      width: json['width'].toDouble(),
      height: json['height'].toDouble(),
      madeOnDate: json['madeOnDate'],
      price: json['price'].toDouble(),
      type: json['type'],
      size: json['size'],
      sizeId: json['sizeId'],
      stockId: json['stockId'],
      quantity: json['quantity'],
    );
  }
}
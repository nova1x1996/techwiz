class ProductDetail {
  final String id;
  final String name;
  final String description;
  final String productType;
  final Plant? plant;
  final Accessory? accessory;
  final List<ImageInfo> images;
  final List<SizeInfo> sizes;

  ProductDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.productType,
    this.plant,
    this.accessory,
    required this.images,
    required this.sizes,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    return ProductDetail(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      productType: json['productType'],
      plant: json['plant'] != null ? Plant.fromJson(json['plant']) : null,
      accessory: json['accessory'] != null ? Accessory.fromJson(json['accessory']) : null,
      images: (json['images'] as List).map((image) => ImageInfo.fromJson(image)).toList(),
      sizes: (json['sizes'] as List).map((size) => SizeInfo.fromJson(size)).toList(),
    );
  }
}

class Plant {
  final String id;
  final String name;
  final String description;
  final String? instruction;
  final bool toxicity;

  Plant({
    required this.id,
    required this.name,
    required this.description,
     this.instruction,
    required this.toxicity,
  });

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      instruction: json['instruction'],
      toxicity: json['toxicity'],
    );
  }
}

class Accessory {
  final String id;
  final String name;
  final String description;
  final String? instruction;
  final AccessoryType type;

  Accessory({
    required this.id,
    required this.name,
    required this.description,
     this.instruction,
    required this.type,
  });

  factory Accessory.fromJson(Map<String, dynamic> json) {
    return Accessory(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      instruction: ( json['instruction']  != null) ? json['instruction']: null,
      type: AccessoryType.fromJson(json['type']),
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

class ImageInfo {
  final String id;
  final String image;
  final bool thumbnail;

  ImageInfo({
    required this.id,
    required this.image,
    required this.thumbnail,
  });

  factory ImageInfo.fromJson(Map<String, dynamic> json) {
    return ImageInfo(
      id: json['id'],
      image: json['image'],
      thumbnail: json['thumbnail'],
    );
  }
}

class SizeInfo {
  final String id;
  final double price;
  final String type;
  final String? madeOnDate;
  final double? width;
  final double? height;
  final int stock;
  final String sizeName;


  SizeInfo({
    required this.id,
    required this.price,
    required this.type,
     this.madeOnDate,
    this.width,
    this.height,
    required this.stock,
    required this.sizeName
  });

  factory SizeInfo.fromJson(Map<String, dynamic> json) {
    return SizeInfo(
      id: json['id'],
          price: json['price'].toDouble(),
      type: json['type'],
      madeOnDate: json['madeOnDate'] != null ? json['madeOnDate'] : null,
      width: json['width'] != null ? json['width'].toDouble() : null,
      height: json['height'] != null ? json['height'].toDouble() : null,
      stock: json['stock'],
      sizeName: json['sizeName'],
    );
  }
}

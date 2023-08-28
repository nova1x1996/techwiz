class Plant {
  final String id;
  final String? name;
  final String? description;
  final String? instruction;
  final String? careLevel;
  final bool? toxicity;
  final String? madeOnDate;
  final List<PlantImage> images;
  final PlantSize? size;

  Plant({
    required this.id,
    this.name,
    this.description,
    this.instruction,
    this.careLevel,
    this.toxicity,
    this.madeOnDate,
    required this.images,
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
      madeOnDate: json['madeOnDate'],
      images: List<PlantImage>.from(json['images'].map((x) => PlantImage.fromJson(x))),
      size: json['size'] != null ? PlantSize.fromJson(json['size']) : null,
    );
  }
}

class PlantImage {
  final String id;
  final String image;
  final bool deleted;
  final bool thumbnail;

  PlantImage({
    required this.id,
    required this.image,
    required this.deleted,
    required this.thumbnail,
  });

  factory PlantImage.fromJson(Map<String, dynamic> json) {
    return PlantImage(
      id: json['id'],
      image: json['image'],
      deleted: json['deleted'],
      thumbnail: json['thumbnail'],
    );
  }
}

class   PlantSize {
  final String id;
  final int width;
  final int height;
  final String madeOnDate;
  final double price;
  final String type;
  final String size;
  final String sizeId;
  final String stockId;
  final int quantity;

  PlantSize({
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

  factory PlantSize.fromJson(Map<String, dynamic> json) {
    return PlantSize(
      id: json['id'],
      width: json['width'],
      height: json['height'],
      madeOnDate: json['madeOnDate'],
      price: json['price'],
      type: json['type'],
      size: json['size'],
      sizeId: json['sizeId'],
      stockId: json['stockId'],
      quantity: json['quantity'],
    );
  }
}

import 'dart:convert';

class ItemModel {
  String objectId;
  String itemName;
  String imgUrl;
  String unit;
  double price;
  String description;

  ItemModel({
    required this.objectId,
    required this.description,
    required this.imgUrl,
    required this.itemName,
    required this.price,
    required this.unit,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'itemId': objectId});
    result.addAll({'itemName': itemName});
    result.addAll({'imgUrl': imgUrl});
    result.addAll({'unit': unit});
    result.addAll({'price': price});
    result.addAll({'description': description});

    return result;
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      objectId: map['itemId'] ?? '',
      itemName: map['itemName'] ?? '',
      imgUrl: map['imgUrl'] ?? '',
      unit: map['unit'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source));
}

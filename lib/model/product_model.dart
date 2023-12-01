import 'package:ecommerce_full/helper/extenstion.dart';
import 'package:flutter/cupertino.dart';

class ProductModel {
  final String name;
  final String image;
  final String description;
  final String sized;
  final String price;
  final Color color;

  ProductModel({
    required this.name,
    required this.image,
    required this.description,
    required this.color,
    required this.sized,
    required this.price,
  });

  ProductModel.fromJson(Map<dynamic, dynamic>? map)
      : name = map?['name'] ?? '',
        image = map?['image'] ?? '',
        description = map?['description'] ?? '',
        color = HexColor.fromHex(map?['color'] ?? 'ffffff'),
        sized = map?['sized'] ?? '',
        price = map?['price']?.toString() ?? '';

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'sized': sized,
      'price': price,
    };
  }
}
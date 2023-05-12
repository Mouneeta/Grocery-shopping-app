// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';
import 'dart:ui';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  String name;
  int id;
  int quantity;
  String imageUrl;
  String price;
  Color color;

  Product({
    required this.name,
    required this.id,
    required this.quantity,
    required this.imageUrl,
    required this.price,
    required this.color,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    name: json["Name"],
    id: json["Id"],
    quantity: json["Quantity"],
    imageUrl: json["ImageUrl"],
    price: json["Price"],
    color: json["Color"],
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "Id": id,
    "Quantity": quantity,
    "ImageUrl": imageUrl,
    "Price": price,
    "Color": color,
  };
}

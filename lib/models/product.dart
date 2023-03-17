// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);
import 'package:_flutterfire_internals/_flutterfire_internals.dart';

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

ProductModel productFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.productID,
    this.productTitle,
    this.price,
    this.description,
    this.date,
    this.isSold,
  });

  String? productID;
  String? productTitle;
  String? price;
  String? description;
  Timestamp? date;
  bool? isSold;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    productID: json["docId"],
    productTitle: json["productTitle"],
    price: json["price"],
    description: json["description"],
    date: json["date"],
    isSold: json["isSold"],
  );

  Map<String, dynamic> toJson() => {
    "docId": productID,
    "productTitle": productTitle,
    "price": price,
    "description": description,
    "date": Timestamp.now(),
    "isSold": isSold,
  };
}

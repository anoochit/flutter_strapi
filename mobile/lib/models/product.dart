// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.brand,
    required this.alcohol,
    required this.images,
  });

  int id;
  String title;
  String description;
  double price;
  Brand brand;
  double alcohol;
  List<Image> images;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"].toDouble(),
        brand: Brand.fromJson(json["brand"]),
        alcohol: json["alcohol"].toDouble(),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "brand": brand.toJson(),
        "alcohol": alcohol,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class Brand {
  Brand({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Image {
  Image({
    required this.id,
    required this.formats,
    required this.url,
  });

  int id;
  Formats formats;
  String url;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        formats: Formats.fromJson(json["formats"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "formats": formats.toJson(),
        "url": url,
      };
}

class Formats {
  Formats({
    required this.thumbnail,
    required this.small,
  });

  Small thumbnail;
  Small small;

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: Small.fromJson(json["thumbnail"]),
        small: Small.fromJson(json["small"]),
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail.toJson(),
        "small": small.toJson(),
      };
}

class Small {
  Small({
    required this.url,
  });

  String url;

  factory Small.fromJson(Map<String, dynamic> json) => Small(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

// To parse this JSON data, do
//
//     final brand = brandFromJson(jsonString);

import 'dart:convert';

List<Brand> brandFromJson(String str) => List<Brand>.from(json.decode(str).map((x) => Brand.fromJson(x)));

String brandToJson(List<Brand> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Brand {
  Brand({
    required this.id,
    required this.name,
    required this.publishedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.products,
  });

  int id;
  String name;
  DateTime publishedAt;
  DateTime createdAt;
  DateTime updatedAt;
  List<Product> products;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
        publishedAt: DateTime.parse(json["published_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "published_at": publishedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

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
  int brand;
  double alcohol;
  List<Image> images;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"].toDouble(),
        brand: json["brand"],
        alcohol: json["alcohol"].toDouble(),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "brand": brand,
        "alcohol": alcohol,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class Image {
  Image({
    required this.id,
    required this.name,
    required this.formats,
    required this.url,
  });

  int id;
  String name;
  Formats formats;
  String url;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        name: json["name"],
        formats: Formats.fromJson(json["formats"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
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

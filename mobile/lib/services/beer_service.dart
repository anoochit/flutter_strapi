import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mobile/models/product.dart';
import 'package:flutter_cache/flutter_cache.dart' as cache;

String baseUrl = "http://e1da-2001-fb1-148-ec8c-2c16-abe8-878d-1728.ngrok.io";

Map<String, String> headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
};

Future<List<Product>> getProducts() async {
  // check data cached already
  var cacheData = await cache.load("products_api");

  if (cacheData == null) {
    log("cache url");
    // not in cache load data from rest api
    var url = Uri.parse(baseUrl + "/products");
    var response = await http.get(
      url,
      headers: headers,
    );

    // log('Response status: ${response.statusCode}');
    // log('Response body: ${response.body}');

    // respond body
    var jsonString = response.body;

    // save to cache for 2 minutes
    cache.remember("products_api", jsonString, 120);

    // parse value
    var products = productFromJson(jsonString);

    return products;
  } else {
    // use data from cahce
    log("cache hit");

    // parse value
    var products = productFromJson(cacheData.toString());
    return products;
  }
}

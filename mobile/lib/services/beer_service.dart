import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mobile/models/product.dart';

String baseUrl = "http://d1ff-2001-fb1-148-9046-85ec-5c91-17a-a23d.ngrok.io";

Map<String, String> headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
};

Future<List<Product>> getProducts() async {
  var url = Uri.parse(baseUrl + "/products");
  var response = await http.get(
    url,
    headers: headers,
  );
  log('Response status: ${response.statusCode}');
  log('Response body: ${response.body}');
  var jsonString = response.body;
  List<Product> products = productFromJson(jsonString);
  return products;
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:toko_sepatu/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<List<ProductModel>> getProduct() async {
    var url = Uri.parse('$baseUrl/products');
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(url, headers: headers);
    debugPrint(response.body);
    debugPrint(response.statusCode.toString());

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Gagal Get Products!');
    }
  }
}

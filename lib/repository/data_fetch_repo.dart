import 'dart:convert';

import 'package:ecommerce/models/productModel.dart';
import 'package:http/http.dart' as http;

class DataFetchRepo {
  final String _baseurl = "https://dummyjson.com/";

  Future<List<Productmodel>> fetchData(String endUrl) async {
    final url = Uri.parse(_baseurl + endUrl);
    try {
      final response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> productList = data["products"];

      List<Productmodel> products = [];
      for (int i = 0; i < productList.length; i++) {
        products.add(Productmodel.fromJson(productList[i]));
      }
      return products;
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<List<dynamic>> fetchCategories(String endUrl) async {
    final url = Uri.parse(_baseurl + endUrl);
    try {
      final response = await http.get(url);
      List<dynamic> data = jsonDecode(response.body);
      return data;
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<Productmodel?> fetchProductDetails(String endUrl) async {
    final url = Uri.parse(_baseurl + endUrl);
    try {
      final response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      Productmodel details = Productmodel.fromJson(data);
      return details;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}

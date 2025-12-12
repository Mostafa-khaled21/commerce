import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/product_model.dart';

class ApiService {
  static const String baseUrl = 'https://dummyjson.com/';

  Future<ProductModel> getProducts() async {
    try {
      final response = await http.get(
        Uri.parse('${baseUrl}products'),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return ProductModel.fromJson(jsonData);
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }

  Future<Product> getProductById(int id) async {
    try {
      final response = await http.get(
        Uri.parse('${baseUrl}products/$id'),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return Product.fromJson(jsonData);
      } else {
        throw Exception('Failed to load product: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching product: $e');
    }
  }
}
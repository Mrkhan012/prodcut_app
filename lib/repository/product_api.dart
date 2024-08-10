
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prodcut_app/model/product_model.dart';

class ProductService {
  final String baseUrl = 'https://api.escuelajs.co/api/v1/products';

  Future<List<Product>> fetchProducts(int offset, int limit) async {
    final response =
        await http.get(Uri.parse('$baseUrl?offset=$offset&limit=$limit'));

    if (response.statusCode == 200) {
      print(response.body);
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Product.fromJson(json)).toList();
    } else {
      print('Failed to load products: ${response.statusCode}');
      throw Exception('Failed to load products');
    }
  }
}
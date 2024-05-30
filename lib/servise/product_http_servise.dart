import 'dart:convert';
import 'package:online_shop/models/product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<Product>> fetchProducts() async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/products");

    final response = await http.get(url);
    final data = jsonDecode(response.body);

    List<Product> loadedProducts = [];
    if (data != null) {
      for (var product in data) {
        loadedProducts.add(Product.fromJson(product));
      }
    }
    return loadedProducts;
  }
}

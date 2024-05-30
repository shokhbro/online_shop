import 'package:online_shop/models/product.dart';
import 'package:online_shop/servise/product_http_servise.dart';

class ProductController {
  final productHttpServise = ProductService();

  Future<List<Product>> getProduct() async {
    List<Product> products = await productHttpServise.fetchProducts();
    return products;
  }
}

import 'package:online_shop/models/categories.dart';
import 'package:online_shop/servise/category_http_servise.dart';

class CategoriesController {
  final categoriesHttpServise = CategoryService();

  Future<List<Categories>> getCategories() async {
    List<Categories> categories = await categoriesHttpServise.fetchCategory();
    return categories;
  }
}

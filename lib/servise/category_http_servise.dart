import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_shop/models/categories.dart';

class CategoryService {
  Future<List<Categories>> fetchCategory() async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/categories");
    final response = await http.get(url);

    final data = jsonDecode(response.body);

    List<Categories> loadedCategory = [];

    if (data != null) {
      for (var category in data) {
        loadedCategory.add(Categories.fromJson(category));
      }
    }
    return loadedCategory;
  }
}

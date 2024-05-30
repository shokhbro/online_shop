import 'package:json_annotation/json_annotation.dart';

part 'categories.g.dart';

@JsonSerializable()
class Categories {
  final int id;
  final String name;
  final String image;
  final String creationAt;
  final String updateAt;

  Categories({
    required this.id,
    required this.name,
    required this.image,
    required this.creationAt,
    required this.updateAt,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return _$CategoriesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoriesToJson(this);
  }
}

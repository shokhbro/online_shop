// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String? ?? "bush",
      image: json['image'] as String? ?? "bush",
      creationAt: json['creationAt'] as String? ?? "bush",
      updateAt: json['updateAt'] as String? ?? "bush",
    );

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'creationAt': instance.creationAt,
      'updateAt': instance.updateAt,
    };

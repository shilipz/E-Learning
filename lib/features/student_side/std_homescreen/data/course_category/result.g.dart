// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResult _$CategoryResultFromJson(Map<String, dynamic> json) =>
    CategoryResult(
      categoryName: json['category_name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CategoryResultToJson(CategoryResult instance) =>
    <String, dynamic>{
      'category_name': instance.categoryName,
      'image': instance.image,
    };

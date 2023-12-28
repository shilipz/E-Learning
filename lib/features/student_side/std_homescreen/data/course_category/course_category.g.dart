// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseCategory _$CourseCategoryFromJson(Map<String, dynamic> json) =>
    CourseCategory(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => CategoryResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseCategoryToJson(CourseCategory instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoursesName _$CoursesNameFromJson(Map<String, dynamic> json) => CoursesName(
      id: json['id'] as int?,
      courseName: json['course_name'] as String?,
      previewVideo: json['preview_video'] as String?,
      bannerImage: json['banner_image'] as String?,
      views: json['views'] as int?,
      likes: json['likes'] as int?,
      isActive: json['is_active'] as bool?,
      categoryRef: json['category_ref'] as int?,
      subCategoryRef: json['sub_category_ref'] as int?,
      tutorRef: json['tutor_ref'] as int?,
    );

Map<String, dynamic> _$CoursesNameToJson(CoursesName instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_name': instance.courseName,
      'preview_video': instance.previewVideo,
      'banner_image': instance.bannerImage,
      'views': instance.views,
      'likes': instance.likes,
      'is_active': instance.isActive,
      'category_ref': instance.categoryRef,
      'sub_category_ref': instance.subCategoryRef,
      'tutor_ref': instance.tutorRef,
    };

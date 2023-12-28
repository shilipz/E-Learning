import 'package:json_annotation/json_annotation.dart';

part 'courses_name.g.dart';

@JsonSerializable()
class CoursesName {
  int? id;
  @JsonKey(name: 'course_name')
  String? courseName;
  @JsonKey(name: 'preview_video')
  String? previewVideo;
  @JsonKey(name: 'banner_image')
  String? bannerImage;
  int? views;
  int? likes;
  @JsonKey(name: 'is_active')
  bool? isActive;
  @JsonKey(name: 'category_ref')
  int? categoryRef;
  @JsonKey(name: 'sub_category_ref')
  int? subCategoryRef;
  @JsonKey(name: 'tutor_ref')
  int? tutorRef;

  CoursesName({
    this.id,
    this.courseName,
    this.previewVideo,
    this.bannerImage,
    this.views,
    this.likes,
    this.isActive,
    this.categoryRef,
    this.subCategoryRef,
    this.tutorRef,
  });

  factory CoursesName.fromJson(Map<String, dynamic> json) {
    return _$CoursesNameFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CoursesNameToJson(this);
}

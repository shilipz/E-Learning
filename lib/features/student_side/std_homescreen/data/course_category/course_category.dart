import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'course_category.g.dart';

@JsonSerializable()
class CourseCategory {
  List<CategoryResult>? results;

  CourseCategory({this.results});

  factory CourseCategory.fromJson(Map<String, dynamic> json) {
    return _$CourseCategoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CourseCategoryToJson(this);
}

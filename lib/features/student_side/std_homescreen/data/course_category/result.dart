import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class CategoryResult {
  @JsonKey(name: 'category_name')
  String? categoryName;
  String? image;

  CategoryResult({this.categoryName, this.image});

  factory CategoryResult.fromJson(Map<String, dynamic> json) {
    return _$CategoryResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryResultToJson(this);
}

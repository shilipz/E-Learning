import 'dart:convert';
import 'dart:developer';

import 'package:elearning/core/api_constants/apis.dart';
import 'package:elearning/features/student_side/std_homescreen/data/course_category/result.dart';
import 'package:http/http.dart' as http;

class CategoriesRepo {
  Future<List<CategoryResult>> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse(categoryApi));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final categoryData = data['results'] as List;
        List<CategoryResult> categories =
            categoryData.map((e) => CategoryResult.fromJson(e)).toList();
        return categories;
      } else {
        log("HTTP Request failed with status: ${response.statusCode}");
      }
    } catch (e) {
      log('error fetching data ${e.toString()}');
    }
    return [];
  }
}

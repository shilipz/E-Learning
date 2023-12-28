// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:elearning/features/student_side/std_homescreen/data/course_category/result.dart';
import 'package:elearning/features/student_side/std_homescreen/data/courses_name/courses_name.dart';
import 'package:elearning/features/student_side/std_homescreen/data/repository/categories_repo/catergories_repo.dart';
import 'package:flutter/material.dart';

class StdHomeScreen extends StatefulWidget {
  const StdHomeScreen({super.key});

  @override
  _StdHomeScreenState createState() => _StdHomeScreenState();
}

class _StdHomeScreenState extends State<StdHomeScreen> {
  final CategoriesRepo categoriesRepo = CategoriesRepo();
  @override
  void initState() {
    super.initState();
  }

  int? value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.purple,
              size: 32,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.purple,
                size: 32,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text("Welcome, Shilpa", style: TextStyle(fontSize: 24)),
                    SizedBox(width: 12),
                    Icon(Icons.waving_hand_rounded, color: Colors.purple)
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/homef.png'),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Categories', style: TextStyle(fontSize: 22)),
                FutureBuilder<List<CategoryResult>>(
                  future: categoriesRepo.fetchCategories(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }

                    List<CategoryResult> categories = snapshot.data!;

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                categories[index].image ??
                                                    'assets/homef.png'))),
                                    child:
                                        Text(categories[index].categoryName!),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
                const Text('Popular Courses', style: TextStyle(fontSize: 22)),
                FutureBuilder<List<CoursesName>>(
                  future: fetchCourseNames(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data == null) {
                      return const Text('No data available');
                    }

                    List<CoursesName> coursesData = snapshot.data!;

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 145,
                                width: 180,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            coursesData[index].bannerImage ??
                                                'assets/homef.png'))),
                              ),
                              Text(
                                coursesData[index].courseName ?? 'N/A',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: 1,
                    );
                  },
                )
              ],
            )),
      ),
    );
  }

  Future<List<CoursesName>> fetchCourseNames() async {
    const String apiUrl = 'http://10.0.2.2:8000/api/user/course-list/';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        List<CoursesName> coursesList = jsonData
            .map((courseJson) => CoursesName.fromJson(courseJson))
            .toList();
        return coursesList;
      } else {
        throw Exception(
            'Failed to load course names. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to make the request: $e');
    }
  }
}

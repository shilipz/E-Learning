// data/repositories/student_repository.dart

// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:elearning/features/student_side/std_homescreen/view/student_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentRepository {
  Future<void> studentLogin(user, BuildContext context) async {
    try {
      final http.Response response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/token/'),
        headers: <String, String>{
          'Content-type': 'application/json',
        },
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        final String accessToken = responseData['access'];
        final String refreshToken = responseData['refresh'];

        final prefs = await SharedPreferences.getInstance();
        prefs.setString('accessToken', accessToken);
        prefs.setString('refreshToken', refreshToken);
        Map<String, dynamic> decodedToken = Jwt.parseJwt(accessToken);

        final String userRole = decodedToken['role'];
        if (userRole == 'student') {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const StdHomeScreen()),
              (route) => false);
        } else {
          log(Error().toString());
        }
      }
      log('outside');
    } catch (e) {
      log(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Center(child: Text('Login failed')),
        ),
      );
    }
  }
}

import 'dart:convert';
import 'dart:developer';
import 'package:elearning/core/constants/constants.dart';
import 'package:elearning/features/common_login/data/models/user_model.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TutorSignup extends StatefulWidget {
  const TutorSignup({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<TutorSignup> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email format';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    final passwordRegex = RegExp(
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{6,}$');

    if (!passwordRegex.hasMatch(value)) {
      return 'Password is invalid';
    }
    return null;
  }

  Future<void> registerUser() async {
    const String apiUrl = "http://10.0.2.2:8000/api/user/register/";

    try {
      final http.Response response = await http.post(Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          //body: jsonEncode(requestBody),
          body: jsonEncode(StudentUserModel(
                  email: emailController.text,
                  phoneNumber: phoneController.text,
                  password: passwordController.text,
                  confirmPassword: confirmPasswordController.text)
              .toJson()));

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: kblue,
            content: Text('Profile created successfully')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: kblue, content: Text('Profile creation failed')));
        log('Registration failed with status code: ${response.statusCode}');
        log('Response body: ${response.body}');
      }
    } catch (e) {
      log('Error during registration: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // Container(
          // height: screenHeight,
          // width: screenWidth,
          // decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //         colors: [kwhite, kpurple])),
          // child:
          SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      validator: validateEmail,
                      controller: emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: phoneController,
                      decoration:
                          const InputDecoration(labelText: 'Phone number'),
                    ),
                    TextFormField(
                      validator: validatePassword,
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Password'),
                    ),
                    TextFormField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration:
                          const InputDecoration(labelText: 'Confirm Password'),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                      ),
                      onPressed: () async {
                        log('message');
                        if (formkey.currentState!.validate()) {
                          await registerUser();
                        }
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => const StdHomeScreen()));
                      },
                      child: const Text(
                        "Sign Up as Tutor",
                        style: TextStyle(color: kwhite),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // );
  }
}

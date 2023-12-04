// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:elearning/domain/models/user_model.dart';
import 'package:elearning/presentation/view/student/std_signup_form.dart';
import 'package:elearning/presentation/view/student/student_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TutorLogin extends StatefulWidget {
  const TutorLogin({super.key});

  @override
  State<TutorLogin> createState() => _TutorLoginState();
}

class _TutorLoginState extends State<TutorLogin> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

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
    if (value == null || value.length < 6) {
      return 'Password must be atleast 6 characters';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child:
              //  Container(
              //   height: screenHeight,
              //   width: screenWidth,
              //   decoration: const BoxDecoration(
              //       gradient: LinearGradient(
              //           begin: Alignment.topCenter,
              //           end: Alignment.bottomCenter,
              //           colors: [kwhite, kpurple])),
              //   child:
              Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                    child: Text(
                      'Welcome back!',
                      style: TextStyle(fontSize: 36),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Form(
                    key: formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          validator: validateEmail,
                          decoration: const InputDecoration(
                              labelText: 'Email', border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: passwordController,
                          validator: validatePassword,
                          obscureText: true,
                          decoration: const InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder()),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        print("helloworld");
                        await studentLogin();
                      }
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => const StdHomeScreen()));
                    },
                    child: const Text("Login"),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('New here?'),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => StudentSignUp()));
                          },
                          child: const Text(
                            "Create an account",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
    // );
  }

  Future<void> studentLogin() async {
    // const String baseUrl = "http://127.0.0.1:8000/api/token/";
    // const String endpoint = "token/";
    // final Map<String, dynamic> requestBody = {
    //   'email': emailController.text,
    //   'password': passwordController.text
    // };
    try {
      print('hello1');
      final http.Response response = await http.post(
          Uri.parse('http://10.0.2.2:8000/api/token/'),
          headers: <String, String>{
            'Content-type': 'application/json',
          },
          body: jsonEncode(StudentUserModel(
                  email: emailController.text,
                  password: passwordController.text)
              .toJson()));
      print(emailController.text);
      log('post request sent');
      print('post request send');
      if (response.statusCode == 200) {
        print(response.statusCode);
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        final String accessToken = responseData['access'];
        final String refreshToken = responseData['refresh'];
        print(refreshToken);
        print(accessToken);
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('accessToken', accessToken);
        prefs.setString('refreshToken', refreshToken);
        Map<String, dynamic> decodedToken = Jwt.parseJwt(accessToken);
        print(decodedToken);
        final String userRole = decodedToken['role'];
        if (userRole == 'tutor') {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => StdHomeScreen()),
              (route) => false);
          // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //   backgroundColor: kwhite,
          //   content: Center(child: Text('Login success')),
          // ));
        } else {
          // log('failed');
          // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //     backgroundColor: Colors.red, content: Text('Login failed')));
        }
      }
      log('outside');
    } catch (e) {
      print('Error during login: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Center(child: Text('Login failed')),
        ),
      );
    }
  }
}

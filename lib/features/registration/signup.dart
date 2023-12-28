import 'package:elearning/core/constants/constants.dart';
import 'package:elearning/features/common_login/view/login.dart';
import 'package:elearning/features/student_side/student_signup/view/std_signup_form.dart';
import 'package:elearning/features/tutor_side/tutor_signup/view/tutor_signup_form.dart';
import 'package:elearning/main.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.05, bottom: screenHeight * 0.08),
                  child: const Text("Create an account",
                      style: TextStyle(fontSize: 34, color: Colors.purple)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 45,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(25)),
                  child: TabBar(
                    indicator: BoxDecoration(
                        //  / color: Colors.green,
                        borderRadius: BorderRadius.circular(12)),
                    labelColor: kwhite,
                    unselectedLabelColor: Colors.black,
                    labelStyle: const TextStyle(color: Colors.black),
                    tabs: const [
                      Tab(text: 'Student Login'),
                      Tab(text: 'Tutor Login'),
                    ],
                  ),
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    StudentSignUp(),
                    TutorSignup(),
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const StdLogin()));
                      },
                      child: const Text(
                        "Go to login",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
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
  }
}

import 'package:elearning/core/constants/constants.dart';
import 'package:elearning/presentation/view/student/std_login.dart';
import 'package:elearning/presentation/view/student/std_signup_form.dart';
import 'package:elearning/presentation/view/teacher/teacher_signup_form.dart';
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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Create an account",
                    style: TextStyle(fontSize: 34, color: kpurple)),
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
              Expanded(
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
                            builder: (context) => StdLogin()));
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

import 'package:elearning/core/constants/constants.dart';
import 'package:elearning/main.dart';
import 'package:flutter/material.dart';

class StdHomeScreen extends StatelessWidget {
  const StdHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Student Home Screen"),
        ),
        body: Container(
            height: screenHeight,
            width: screenWidth,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [kwhite, kpurple])),
            child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: []))));
  }
}

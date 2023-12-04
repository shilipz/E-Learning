import 'package:elearning/core/constants/constants.dart';
import 'package:elearning/presentation/blocs/courses_bloc/course_bloc_bloc.dart';
import 'package:flutter/material.dart';

class TeacherProfile extends StatefulWidget {
  const TeacherProfile({super.key});

  @override
  State<TeacherProfile> createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  final CourseBloc courseBloc = CourseBloc();
  @override
  void initState() {
    courseBloc.add(CourseInitialsFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomCenter,
                colors: [kblue, kwhite])),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                'Profile',
                style: TextStyle(color: kwhite, fontSize: 24),
              ),
              Spacer(),
              Row(
                children: [
                  Icon(Icons.logout),
                  TextButton(
                      onPressed: () {
                        signoutUser();
                      },
                      child: Text(
                        'Sign out',
                        style: TextStyle(fontSize: 24),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void signoutUser() {}
}

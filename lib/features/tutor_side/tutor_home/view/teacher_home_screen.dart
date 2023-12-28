import 'package:elearning/core/constants/constants.dart';
import 'package:elearning/features/tutor_side/tutor_profile/view/teacher_profile.dart';
import 'package:flutter/material.dart';

class TutorHomeScreen extends StatelessWidget {
  const TutorHomeScreen({super.key});

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
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const TeacherProfile();
                            }));
                          },
                          icon: Icon(
                            Icons.person,
                            size: 42,
                          ))
                    ],
                  ),
                  Center(
                    child: Text('Home Screen'),
                  )
                ],
              ),
            )));
  }
}

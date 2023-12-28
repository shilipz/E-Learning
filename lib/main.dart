// ignore_for_file: unnecessary_null_comparison

import 'package:elearning/core/utils/utils.dart';
import 'package:elearning/features/common_login/bloc/login_bloc.dart';
import 'package:elearning/features/common_login/view/login.dart';
import 'package:elearning/features/registration/signin_homescreen.dart';
import 'package:elearning/features/student_side/std_homescreen/view/student_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? accessToken = prefs.getString('accessToken');
  runApp(MyApp(accessToken: accessToken));
}

final screenWidth = ScreenSize.screenWidth;
final screenHeight = ScreenSize.screenHeight;

class MyApp extends StatelessWidget {
  final String? accessToken;
  const MyApp({super.key, required this.accessToken});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        // BlocProvider(
        //   create: (context) => ProductSearchBloc(),
        // ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: accessToken != null ? const StdHomeScreen() : const StdLogin()),
    );
  }
}

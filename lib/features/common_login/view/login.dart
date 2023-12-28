// ignore_for_file: use_build_context_synchronously
import 'package:elearning/features/common_login/bloc/login_bloc.dart';
import 'package:elearning/features/common_login/data/models/user_model.dart';
import 'package:elearning/features/common_login/data/repository/repository.dart';
import 'package:elearning/features/common_login/domain/Usecases/validate_usecase.dart';
import 'package:elearning/features/registration/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StdLogin extends StatefulWidget {
  const StdLogin({super.key});

  @override
  State<StdLogin> createState() => _StdLoginState();
}

class _StdLoginState extends State<StdLogin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final ValidateUserUsecase validateUserUsecase = ValidateUserUsecase();
  final StudentRepository studentRepository = StudentRepository();

  String? validateEmail(String? value) {
    return validateUserUsecase.validateEmail(value);
  }

  String? validatePassword(String? value) {
    return validateUserUsecase.validatePassword(value);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child:
              // Container(
              //   height: screenHeight,
              //   width: screenWidth,
              //   decoration: const BoxDecoration(
              //       gradient: LinearGradient(
              //           begin: Alignment.topCenter,
              //           end: Alignment.bottomCenter,
              //           colors: [kwhite, kpurple])),
              //   child:
              BlocProvider(
            create: (context) => LoginBloc(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //----------------------------------------welcome text starts here-----------------------------------
                    const Center(
                        child: Text('Elearning',
                            style:
                                TextStyle(fontSize: 36, color: Colors.purple))),
                    //-------------------------------------------welcome text ends here-----------------------------------

                    const SizedBox(height: 30),
                    Center(
                      child: Image.asset('assets/homef.png'),
                    ),

                    //-----------------------------------------form starts here--------------------------------------------

                    Form(
                      key: formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            validator: validateEmail,
                            decoration: const InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                    borderSide: BorderSide())),
                          ),

                          //---------------------------------------email textformfield ended-----------------------------------

                          const SizedBox(height: 16.0),

                          //------------------------------------password textformfield started-------------------

                          TextFormField(
                            controller: passwordController,
                            validator: validatePassword,
                            obscureText: true,
                            decoration: const InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder()),
                          ),

                          //--------------------------------------------password textformfield ended------------------------
                        ],
                      ),
                    ),

                    //------------------------------------form ends here-------------------------------------

                    const SizedBox(height: 16.0),

                    //-------------------------elevated button for login starts here---------------------------------

                    ElevatedButton(
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          StudentUserModel user = StudentUserModel(
                              email: emailController.text,
                              password: passwordController.text);
                          await studentRepository.studentLogin(user, context);
                        }
                      },
                      child: const Text("Login"),
                    ),

                    //--------------------------------------elevated button ends here-----------------------------------------

                    const SizedBox(
                      height: 150,
                    ),

                    //--------------------------------create new account text starts here------------------------------------------

                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('New here?'),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
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

                    //---------------------------------------text ends here---------------------------------
                  ]),

              //-----------------------every widget is inside this column and padded by the padding below-------------------------
            ),
          ),
        ),
      ),
    );
    // )
  }
}

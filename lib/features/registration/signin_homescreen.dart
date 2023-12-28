import 'package:elearning/core/constants/constants.dart';
import 'package:elearning/features/common_login/view/login.dart';
import 'package:elearning/features/registration/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          //  Container(
          //   height: screenHeight,
          //   width: screenWidth,
          //   decoration: const BoxDecoration(
          //       gradient: LinearGradient(
          //           begin: Alignment.topCenter,
          //           end: Alignment.bottomCenter,
          //           colors: [kwhite, kblue])),
          //   child:
          SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 36.0),
                  const Center(
                    child: Text(
                      'Elearning',
                      style: TextStyle(fontSize: 36),
                    ),
                  ),
                  const SizedBox(height: 200.0),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StdLogin()),
                      );
                    },
                    child: Container(
                      height: 43,
                      decoration:
                          BoxDecoration(border: Border.all(color: kblue)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.mail_lock_outlined),
                          SizedBox(
                            width: 18,
                          ),
                          Text(
                            'Sign in with email',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  // const SizedBox(height: 22.0),
                  // Container(
                  //   height: 43,
                  //   decoration:
                  //       BoxDecoration(border: Border.all(color: kwhite)),
                  //   child: const Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Icon(Icons.facebook),
                  //       SizedBox(width: 18),
                  //       Text(
                  //         'Sign in with Google',
                  //         style: TextStyle(
                  //             fontSize: 18, fontWeight: FontWeight.bold),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(height: 22.0),
                  // Container(
                  //   height: 43,
                  //   decoration:
                  //       BoxDecoration(border: Border.all(color: kwhite)),
                  //   child: const Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Icon(Icons.facebook),
                  //       SizedBox(
                  //         width: 18,
                  //       ),
                  //       Text(
                  //         'Sign in with Facebook',
                  //         style: TextStyle(
                  //             fontSize: 18, fontWeight: FontWeight.bold),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(height: 16.0),
                ],
              ),
              const SizedBox(height: 200),
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
            ],
          ),
        ),
      ),
    );
    // );
  }
}

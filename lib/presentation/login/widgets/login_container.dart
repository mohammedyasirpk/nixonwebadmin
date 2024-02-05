import 'package:flutter/material.dart';

import 'signin_container.dart';
import 'signout_container.dart';

enum Auth { signIn, signUp }

class LoginContainer extends StatefulWidget {
const  LoginContainer({Key? key});

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Set your default value here
    ValueNotifier<Auth> selectedAuth = ValueNotifier(Auth.signIn);

    return Container(
      width: 400,
      height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjusted here
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.green[200],
                  ),
                  child: Row(
                    children: [
                      ValueListenableBuilder(
                        valueListenable: selectedAuth,
                        builder: (context, value, child) {
                          return Container(
                            color: value == Auth.signIn
                                ? Colors.green
                                : Colors.green[200],
                            child: TextButton(
                              onPressed: () {
                                selectedAuth.value = Auth.signIn;
                              },
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                     color: Colors.white,
                                    
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      ValueListenableBuilder(
                        valueListenable: selectedAuth,
                        builder: (context, value, child) {
                          return Container(
                            color: value == Auth.signUp
                                ? Colors.green
                                : Colors.green[200],
                            child: TextButton(
                              onPressed: () {
                                selectedAuth.value = Auth.signUp;
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
         ValueListenableBuilder(valueListenable: selectedAuth, builder: (context, value, child) {
           return value == Auth.signIn ? const SgninLoginContainer() : const SignoutContainer();
         },),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nixon/presentation/home/screen_home.dart';
import 'package:nixon/presentation/login/mainLogin.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return  const HomeScreen();
          } else {
            return  const MainPage();
          }
        },
      ),
    );
  }
}

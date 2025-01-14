// ignore_for_file: prefer_const_constructors

import 'package:firebase_practice/pages/home_page.dart';
import 'package:firebase_practice/services/authService.dart';
import 'package:firebase_practice/widgets/btn_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Login'),
        backgroundColor: Color.fromARGB(255, 0, 140, 175),
      ),
      backgroundColor: Color.fromARGB(255, 0, 140, 175),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              padding: EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 25.0),
                  BtnLogin(
                    text: "Google Login",
                    onPressed: () async {
                      final user = await AuthService.signInWithGoogle();
                      if (user != null) {
                        print('Logged in as: ${user.displayName}');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Welcome, ${user.displayName}!')),
                        );
                        Get.to(HomePage());
                      } else {
                        print('Google Sign-In canceled.');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Google Sign-In failed or was canceled')),
                        );
                      }
                    },
                    bgColor: Colors.white,
                    borderColor: Colors.black,
                    textColor: Colors.black,
                    fontSize: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

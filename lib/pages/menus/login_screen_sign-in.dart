// ignore_for_file: prefer_const_constructors

import 'package:firebase_practice/controllers/login_controller.dart';
import 'package:firebase_practice/pages/dashboard_page.dart';
import 'package:firebase_practice/routes/myAppRoute.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_practice/pages/menus/home_page.dart';
import 'package:firebase_practice/services/authService.dart';
import 'package:firebase_practice/widgets/btn_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 5),
                  )
                ],
              ),
              padding: EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.indigo,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Log in to continue",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 25.0),
                  BtnLogin(
                    text: "Google Login",
                    onPressed: authController.signInWithGoogle,
                    bgColor: Colors.indigo,
                    borderColor: Colors.indigoAccent,
                    textColor: Colors.white,
                    fontSize: 18,
                    icon: Image.asset(
                      'assets/Google.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  BtnLogin(
                      text: "Continue without account",
                      onPressed: () => Get.toNamed(MyAppsRoute.navbar),
                      bgColor: Colors.indigo,
                      borderColor: Colors.indigoAccent,
                      textColor: Colors.white,
                      fontSize: 18,
                      icon: null)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

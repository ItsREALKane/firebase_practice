// ignore_for_file: prefer_const_constructors

import 'package:firebase_practice/widgets/btn_login.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Color.fromARGB(255, 0, 140, 175),
      ),
      backgroundColor: Color.fromARGB(255, 0, 140, 175),
      body: Center(
        child: LoginCard(),
      ),
    );
  }
}

class LoginCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: 300,
            height: 500,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Log In",
                    style: TextStyle(fontSize: 35),
                  ),
                  SizedBox(height: 25.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    obscureText: true,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Column(
                    children: [
                      BtnLogin(
                        text: "Login",
                        onPressed: () {},
                        bgColor: Colors.white,
                        borderColor: Colors.black,
                        textColor: Colors.black,
                        fontSize: 16,
                      ),
                      SizedBox(height: 8),
                      BtnLogin(
                        text: "Sign Up",
                        onPressed: () {},
                        bgColor: Colors.white,
                        borderColor: Colors.black,
                        textColor: Colors.black,
                        fontSize: 16,
                      ),
                      SizedBox(height: 8),
                      BtnLogin(
                        text: "Google Login",
                        onPressed: () {},
                        bgColor: Colors.white,
                        borderColor: Colors.black,
                        textColor: Colors.black,
                        fontSize: 16,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:firebase_practice/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mencobaaaaa',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: ( )=> LoginScreen())
      ],
    );
  }
}

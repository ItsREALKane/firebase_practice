// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_practice/api/firebase_api.dart';
import 'package:firebase_practice/controllers/login_controller.dart';
import 'package:firebase_practice/routes/myAppRoute.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().iniNotification();
  await GetStorage.init();

  Get.put(AuthController()); // Inisialisasi AuthController

  // Cek status login
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mencobaaaaa',
      initialRoute: isLoggedIn ? MyAppsRoute.navbar : MyAppsRoute.login,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
    );
  }
}

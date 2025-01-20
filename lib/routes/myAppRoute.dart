import 'package:firebase_practice/pages/menus/home_page.dart';
import 'package:firebase_practice/pages/login_screen_sign-in.dart';
import 'package:get/get.dart';

class MyAppsRoute {
  static const login = '/login';
  static const home = '/home';
  //lanjutt
}

class AppPages {
  //registrasi semua page dan binding
  static final pages = [
    GetPage(
      name: MyAppsRoute.login,
      page: () => LoginScreen(),
    ),
    GetPage(name: MyAppsRoute.home, page: () => HomePage())
  ];
}

import 'package:firebase_practice/bindings/home_binding.dart';
import 'package:firebase_practice/bindings/login_binding.dart';
import 'package:firebase_practice/controllers/login_controller.dart';
import 'package:firebase_practice/pages/dashboard_page.dart';
import 'package:firebase_practice/pages/menus/home_page.dart';
import 'package:firebase_practice/pages/menus/login_screen_sign-in.dart';
import 'package:firebase_practice/pages/menus/profile_pages.dart';
import 'package:get/get.dart';

class MyAppsRoute {
  static const login = '/login';
  static const home = '/home';
  static const profile = '/profile';
  static const navbar = '/navbar';
  //lanjutt
}

class AppPages {
  //registrasi semua page dan binding
  static final pages = [
    GetPage( 
      name: MyAppsRoute.navbar,
      page: () => DashboardPage(),),
    GetPage(
        name: MyAppsRoute.login,
        page: () => LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: MyAppsRoute.home, 
        page: () => HomePage(), 
        binding: HomeBinding()),
      GetPage(
        name: MyAppsRoute.profile, 
        page: () => ProfilePage(), 
        binding: LoginBinding()),
  ];
}

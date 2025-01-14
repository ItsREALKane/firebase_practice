import 'package:firebase_practice/routes/myAppRoute.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final storage = GetStorage();

  @override
  void onInit() { 
    super.onInit();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 7));
    
    final isLoggedIn = storage.read('isLoggedIn') ?? false;
    
    if (isLoggedIn) {
      Get.offAllNamed(MyAppsRoute.home,);
    } else {
      Get.offAllNamed(MyAppsRoute.login);
    }
  }
}
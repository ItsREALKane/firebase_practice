import 'package:firebase_practice/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
  }

}
import 'package:firebase_practice/models/user_profile.dart';
import 'package:firebase_practice/pages/dashboard_page.dart';
import 'package:firebase_practice/pages/menus/login_screen_sign-in.dart';
import 'package:get/get.dart';
import 'package:firebase_practice/services/authService.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var userProfile = Rxn<UserProfile>(); 
  final box = GetStorage(); 

  @override
  void onInit() {
    super.onInit();
    _loadUserData(); 
  }

  Future<void> signInWithGoogle() async {
    isLoading.value = true; // Set loading state
    try {
      final user = await AuthService.signInWithGoogle();
      if (user != null) {
        // Set user profile
        userProfile.value = UserProfile(
          name: user.displayName ?? "No Name",
          email: user.email ?? "No Email",
          photoUrl: user.photoURL ?? "",
        );

        // Simpan data user ke GetStorage
        box.write('name', user.displayName ?? "No Name");
        box.write('email', user.email ?? "No Email");
        box.write('photoUrl', user.photoURL ?? "");
        box.write('isLoggedIn', true); 

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('name', user.displayName ?? "No Name");
        await prefs.setString('email', user.email ?? "No Email");
        await prefs.setString('photoUrl', user.photoURL ?? "");
        await prefs.setBool('isLoggedIn', true);

        print('User logged in: true');
        Get.to(() => DashboardPage(),
            transition: Transition.circularReveal,
            duration: Duration(seconds: 1));
      } else {
        Get.snackbar('Error', 'Google Sign-In failed or was canceled');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong: $e');
    } finally {
      isLoading.value = false; 
    }
  }

  Future<void> logout() async {
    isLoading.value = true;
    try {
      await AuthService.signOut();
      userProfile.value = null;
      box.erase(); 

      // Hapus data dari SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      Get.toNamed('/login');
      Get.snackbar('Success', 'Logged out successfully');
    } catch (e) {
      Get.snackbar('Error', 'Logout failed: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      userProfile.value = UserProfile(
        name: prefs.getString('name') ?? "No Name",
        email: prefs.getString('email') ?? "No Email",
        photoUrl: prefs.getString('photoUrl') ?? "",
      );
    }
  }
}

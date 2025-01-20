import 'package:firebase_practice/models/user_profile.dart';
import 'package:firebase_practice/pages/dashboard_page.dart';
import 'package:get/get.dart';
import 'package:firebase_practice/services/authService.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var userProfile = Rxn<UserProfile>(); // Observable user profile

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

        // Navigate to profile page or dashboard
        Get.to(() => DashboardPage(),
            transition: Transition.circularReveal,
            duration: Duration(seconds: 1));
      } else {
        Get.snackbar('Error', 'Google Sign-In failed or was canceled');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong: $e');
    } finally {
      isLoading.value = false; // Reset loading state
    }
  }
}

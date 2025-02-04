import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController {
  static const String _keyUsername = "username";

  Future<void> saveUsername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUsername, username);
  }

  Future<String?> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUsername);
  }

  Future<void> clearUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUsername);
  }
}

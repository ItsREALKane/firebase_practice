import 'package:firebase_practice/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Obx(() {
          final userProfile = authController.userProfile.value;

          if (userProfile == null) {
            return Text("No user logged in.");
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: userProfile.photoUrl.isNotEmpty
                    ? NetworkImage(userProfile.photoUrl)
                    : null,
                child: userProfile.photoUrl.isEmpty
                    ? Icon(Icons.person, size: 50)
                    : null,
              ),
              SizedBox(height: 20),
              Text(
                userProfile.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                userProfile.email,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          );
        }),
      ),
    );
  }
}

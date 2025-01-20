// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_practice/controllers/dashboard_controller.dart';
import 'package:firebase_practice/pages/menus/home_page.dart';
import 'package:firebase_practice/pages/menus/profile_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController =
        Get.put(DashboardController());

    final List<Widget> menus = [HomePage(), ProfilePage()];

    return Obx(() {
      return Scaffold(
        body: menus[dashboardController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.cyanAccent,
            unselectedItemColor: Colors.amberAccent,
            currentIndex: dashboardController.selectedIndex.value,
            onTap: dashboardController.changeMenu,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_sharp), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ]),
      );
    });
  }
}

import 'package:anidex/app/modules/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController {
  // Observable for the selected tab index
  final selectedIndex = 0.obs;

  // List of pages to display
  final pages = [
    HomeScreen(),
    Container(color: Colors.blue),
    Container(color: Colors.green),
    Container(color: Colors.grey),
  ];

  // Method to change tabs
  void changeTab(int index) {
    selectedIndex.value = index;
  }
}

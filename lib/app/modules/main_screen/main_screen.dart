import 'dart:ui';

import 'package:anidex/app/modules/main_screen/main_screen_controller.dart';
import 'package:flutter/material.dart';

import '../../core/utils/exports.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainScreenController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: kBottomNavigationBarHeight + 20,
                  ),
                  child: controller.pages[controller.selectedIndex.value],
                ),
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
        ),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.6),
                border: Border(
                  top: BorderSide(
                    color: Colors.blue.withValues(alpha: 0.3),
                    width: 0.5,
                  ),
                ),
              ),
              child: Obx(
                () => BottomNavigationBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.white.withValues(alpha: 0.6),
                  currentIndex: controller.selectedIndex.value,
                  onTap: controller.changeTab,
                  selectedLabelStyle: const TextStyle(color: Colors.white),
                  unselectedLabelStyle: TextStyle(
                    color: Colors.white.withValues(alpha: 0.6),
                  ),
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.explore),
                      label: 'Explore',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.bookmark),
                      label: 'Bookmarked',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Settings',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:anidex/app/modules/main_screen/main_screen_controller.dart';
import 'package:flutter/material.dart';

import '../../core/utils/exports.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainScreenController());
    return Scaffold();
  }
}

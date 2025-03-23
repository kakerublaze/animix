import 'package:anidex/app/core/constants/app_colors.dart';
import 'package:anidex/app/core/utils/exports.dart';
import 'package:anidex/app/modules/movies_details_screen/movies_details_screen_controller.dart';
import 'package:flutter/material.dart';

class MoviesDetailsScreen extends StatelessWidget {
  const MoviesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MoviesDetailsScreenController());
    return Scaffold(
      backgroundColor: AppColors.appDarkBasedTextColor,
      body: Container(
        
      ),
    );
  }
}

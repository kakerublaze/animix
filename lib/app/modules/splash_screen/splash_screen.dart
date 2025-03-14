import 'package:anidex/app/core/constants/app_colors.dart';
import 'package:anidex/app/core/constants/asset_paths.dart';
import 'package:anidex/app/core/utils/exports.dart';
import 'package:anidex/app/core/utils/extensions.dart';
import 'package:anidex/app/modules/splash_screen/splash_screen_controller.dart';
import 'package:anidex/app/widgets/custom_loader.dart';
import 'package:flutter/material.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      backgroundColor: AppColors.appDarkModeBaseColor,
      body: Column(
        children: [
          40.heightBox,
          Expanded(
            child: Center(
              child: ShaderMask(
                shaderCallback: (bounds) {
                  return AppColors.secondaryGradient.createShader(bounds);
                },
                child: Image.asset(
                  AssetPaths.appIcon,
                  width: 160,
                  height: 160,
                  fit: BoxFit.contain,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          CustomLoader(isCircular: true),
          40.heightBox,
        ],
      ),
    );
  }
}

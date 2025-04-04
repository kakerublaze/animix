import 'package:anidex/app/core/utils/exports.dart';
import 'package:anidex/app/modules/splash_screen/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(() => SplashScreenController());
  }
}

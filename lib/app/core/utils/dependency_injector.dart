import 'package:anidex/app/core/utils/exports.dart';
import 'package:anidex/app/modules/splash_screen/splash_screen_controller.dart';

class DependencyInjector {
  static init() {
    Get.lazyPut(() => SplashScreenController(), fenix: true);
  }
}

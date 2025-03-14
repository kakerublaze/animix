import 'package:anidex/app/core/utils/exports.dart';
import 'package:anidex/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Future.delayed(
      Duration(milliseconds: 1500),
      () => Get.offAllNamed(Routes.mainScreen),
    );
    super.onInit();
  }
}

import 'package:anidex/app/core/utils/exports.dart';
import 'package:anidex/app/modules/main_screen/main_screen_controller.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainScreenController>(() => MainScreenController());
  }
}

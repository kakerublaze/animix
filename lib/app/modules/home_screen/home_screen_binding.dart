import 'package:anidex/app/core/utils/exports.dart';
import 'package:anidex/app/modules/home_screen/home_screen_controller.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
  }
}

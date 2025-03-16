import 'package:anidex/app/modules/movies_details_screen/movies_details_screen_controller.dart';
import 'package:get/get.dart';

class MoviesDetailsScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoviesDetailsScreenController>(
      () => MoviesDetailsScreenController(),
    );
  }
}

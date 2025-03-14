import 'package:anidex/app/core/utils/exports.dart';
import 'package:anidex/app/modules/main_screen/main_screen.dart';
import 'package:anidex/app/modules/main_screen/main_screen_binding.dart';
import 'package:anidex/app/modules/splash_screen/splash_screen.dart';
import 'package:anidex/app/modules/splash_screen/splash_screen_binding.dart';

part 'app_routes.dart';

class AppPages {
  static const initialRoute = Routes.splashScreen;

  static final routes = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => const MainScreen(),
      binding: MainScreenBinding(),
    ),
  ];
}

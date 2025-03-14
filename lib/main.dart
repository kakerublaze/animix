import 'package:anidex/app/core/constants/app_constant.dart';
import 'package:anidex/app/core/utils/dependency_injector.dart';
import 'package:anidex/app/core/utils/exports.dart';
import 'package:anidex/app/core/utils/extensions.dart';
import 'package:anidex/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjector.init();
  await dotenv.load(fileName: "lib/.env");
  runApp(
    const MyApp().onTap(() {
      FocusManager.instance.primaryFocus?.unfocus();
    }),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      // theme: AppTheme.lightTheme,
      initialRoute: AppPages.initialRoute,
      getPages: AppPages.routes,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

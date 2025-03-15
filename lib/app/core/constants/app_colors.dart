import 'package:flutter/material.dart';

class AppColors {
  static Color appDarkModeBaseColor = Colors.black; // App Dark Mode Base Color
  static Color appLigthModeBaseColor =
      Colors.white; // App Ligth Mode Base Color
  // static Color appSecondaryColor = Color(0xff11d357); // App Secondary Color
  static Color appSecondaryColor = Color(0xff4AB9FF); // App Secondary Color
  static Color appSecondaryDarkColor = Color(
    0xff0084F3,
  ); // App Secondary Dark Color
  static LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: const [0.3, 0.7],
    colors: [appSecondaryColor, appSecondaryDarkColor],
  );
  static Color appDarkBasedTextColor = Colors.white;
  static Color appLightBasedTextColor = Colors.black;
  static Color seeAllTextColor = Colors.blue;
}

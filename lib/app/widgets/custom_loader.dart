import 'package:anidex/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoader extends StatelessWidget {
  final bool isCircular;

  const CustomLoader({super.key, this.isCircular = true});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          isCircular
              ? SpinKitCircle(color: AppColors.appSecondaryColor, size: 50.0)
              : SpinKitWave(color: AppColors.appSecondaryColor, size: 50.0),
    );
  }
}

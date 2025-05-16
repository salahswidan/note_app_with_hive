
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/color_manager.dart';

class CustomBottomNavBarOnBoardingScreen extends StatelessWidget {
  const CustomBottomNavBarOnBoardingScreen({
    super.key, required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(75, 75),
            backgroundColor: ColorManager.KPrimaryColor,
            shape: const CircleBorder(),
          ),
          onPressed: onPressed,
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 15.sp,
          )),
    );
  }
}

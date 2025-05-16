
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/color_manager.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key, required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(70, 70),
          backgroundColor: ColorManager.KPrimaryColor,
          shape: const CircleBorder(),
        ),
        onPressed: onPressed,
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 24.sp,
          ),
        ));
  }
}

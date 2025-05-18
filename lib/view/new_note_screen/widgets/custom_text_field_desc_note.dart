
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/color_manager.dart';

class CustomTextFieldDescNote extends StatelessWidget {
  const CustomTextFieldDescNote({
    super.key,
    required this.descController,
  });
  final TextEditingController descController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: descController,
      style: TextStyle(
        color: Colors.black,
        fontSize: 23.sp,
        fontFamily: "Otama",
      ),
      maxLength: null,
      decoration: InputDecoration(
        hintText: "Type Something....",
        hintStyle: TextStyle(
          color: ColorManager.KGrey2Color,
          fontSize: 23.sp,
          fontFamily: "Otama",
        ),
        border: InputBorder.none,
      ),
    );
  }
}

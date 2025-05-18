
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/color_manager.dart';

class CustomTextFieldTitle extends StatelessWidget {
  const CustomTextFieldTitle({
    super.key,
    required this.titleController,
  });
  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: titleController,
      style: TextStyle(
        color: Colors.black,
        fontSize: 48.sp,
        fontFamily: "Otama",
      ),
      maxLines: 1,
      decoration: InputDecoration(
        hintText: "Title",
        hintStyle: TextStyle(
          color: ColorManager.KGrey2Color,
          fontSize: 48.sp,
          fontFamily: "Otama",
        ),
        border: InputBorder.none,
      ),
    );
  }
}

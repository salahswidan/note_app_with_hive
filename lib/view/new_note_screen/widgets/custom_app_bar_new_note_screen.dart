import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/resources/color_manager.dart';

class CustomAppBarNewNoteScreen extends StatelessWidget {
  const CustomAppBarNewNoteScreen({
    super.key,
    required this.onPressedBack,
    required this.onPressedAtMark,
    required this.editNow,
  });
  final VoidCallback onPressedBack;
  final VoidCallback onPressedAtMark;
  final bool? editNow;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton.icon(
          icon: Icon(
            CupertinoIcons.back,
            color: ColorManager.KPrimaryColor,
            size: 30,
          ),
          onPressed: onPressedBack,
          label: Text(
            "Back",
            style: TextStyle(
                color: ColorManager.KPrimaryColor,
                fontSize: 20,
                fontFamily: "Otama",
                fontWeight: FontWeight.w700),
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 6.h),
              fixedSize: const Size(33, 33),
              backgroundColor: ColorManager.KPrimaryColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            onPressed: onPressedAtMark,
            child: Center(
              child: Icon(
                editNow == null
                    ? CupertinoIcons.check_mark_circled
                    : editNow == false
                        ? Icons.edit
                        : CupertinoIcons.check_mark_circled,
                color: Colors.white,
                size: 20.sp,
              ),
            ))
      ],
    );
  }
}

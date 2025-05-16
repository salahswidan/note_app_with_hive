import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomEmptyBodyHomeScreen extends StatelessWidget {
  const CustomEmptyBodyHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/on_boarding_png.png",
              width: 286.w,
            ),
            SizedBox(
              height: 6.h,
            ),
            Text(
              "Create Your first note!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                fontFamily: "Otama",
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 55.h,
            ),
          ]),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/core/resources/color_manager.dart';

class CustomGridViewNoteBody extends StatelessWidget {
  const CustomGridViewNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(25.w),
      itemCount: 5,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 146.h,
        crossAxisCount: 2,
        crossAxisSpacing: 11.w,
        mainAxisSpacing: 9.h,
      ),
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Color(0xff021815),
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(children: [
                  Positioned(
                    child: Text(
                      "1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontFamily: "Otama",
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/images/background_id.svg")
                ]),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff02463d),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        onPressed: () {},
                        label: Text(
                          "Done",
                          style: TextStyle(
                              fontFamily: "Otama",
                              color: Colors.white,
                              fontSize: 12.sp),
                        ),
                        icon: Icon(
                          CupertinoIcons.checkmark_alt_circle_fill,
                          color: ColorManager.KLightGreenColor,
                        )),
                    Text("Man, April,2025",
                        style: TextStyle(color: Colors.white, fontSize: 8.sp)),
                  ],
                ),
              ],
            ),
            Text("Title 1",
                maxLines: 1,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontFamily: "Otama",
                    fontWeight: FontWeight.w700)),
            SizedBox(
              height: 4.h,
            ),
            Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
              style: TextStyle(
                color: ColorManager.KGrey2Color,
                fontSize: 8.sp,
                fontFamily: "Otama",
              ),
            )
          ],
        ),
      ),
    );
  }
}

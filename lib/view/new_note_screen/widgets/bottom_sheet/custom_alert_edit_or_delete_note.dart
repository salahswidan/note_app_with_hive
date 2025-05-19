import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';

class CustomAlertEditOrDeleteNote extends StatelessWidget {
  const CustomAlertEditOrDeleteNote({
    super.key,
    required this.onTapAtDeleteButton,
    required this.onTapAtEditBotton,
    required this.onPressedClose,
  });
  final GestureTapCallback onTapAtDeleteButton;
  final GestureTapCallback onTapAtEditBotton;
  final VoidCallback onPressedClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 16.h,
      ),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  Text(
                    "What do you want to do?",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: "Otama",
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Select",
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: "Otama",
                      fontWeight: FontWeight.bold,
                      color: ColorManager.KGrey2Color,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 41.w,
              ),
              IconButton.filled(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(24.w, 24.h),
                  backgroundColor: ColorManager.KGrey2Color,
                ),
                onPressed: onPressedClose,
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 8.sp,
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Divider(
            height: 0,
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  CustomOkButton(
                    onTapAtEditBotton: onTapAtEditBotton,
                  ),
                ],
              ),
              SizedBox(
                width: 33.w,
              ),
              CustomDeleteButton(
                onTapAtDeleteButton: onTapAtDeleteButton,
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}

class CustomDeleteButton extends StatelessWidget {
  const CustomDeleteButton({
    super.key,
    required this.onTapAtDeleteButton,
  });
  final GestureTapCallback onTapAtDeleteButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
            onTap: onTapAtDeleteButton,
            child: Icon(
              CupertinoIcons.delete,
              color: Colors.red,
            )),
        Text(
          "Delete",
          style: TextStyle(
              color: Colors.red, fontSize: 10.sp, fontFamily: "Otama"),
        ),
      ],
    );
  }
}

class CustomOkButton extends StatelessWidget {
  const CustomOkButton({
    super.key,
    required this.onTapAtEditBotton,
  });
  final GestureTapCallback onTapAtEditBotton;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTapAtEditBotton,
        child: Column(
          children: [
            Icon(
              CupertinoIcons.pencil_circle,
              color: ColorManager.KPrimaryColor,
            ),
            Text(
              "Edit",
              style: TextStyle(
                  color: ColorManager.KGrey2Color,
                  fontSize: 10.sp,
                  fontFamily: "Otama"),
            ),
          ],
        ));
  }
}

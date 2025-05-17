import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/resources/color_manager.dart';
import '../../../controller/on_boarding/on_boarding_controller.dart';
import '../widgets/custom_bottom_nav_bar_on_boarding.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late OnBoardingController _controller;
  @override
  @override
  void initState() {
    super.initState();
    _controller = OnBoardingController();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: CustomBottomNavBarOnBoardingScreen(
          onPressed: () {
            _controller.goToHomeScreen(context);
          },
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
          ),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 125.h,
                  ),
                  Image.asset(
                    "assets/images/on_boarding_png.png",
                    width: 280.w,
                  ),
                  SizedBox(
                    height: 55.h,
                  ),
                  Text(
                    "All thoughts one place.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 48.sp,
                      fontFamily: "Otama",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Drive right in and clear that mind of yours by writing down",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: "Otama",
                      color: ColorManager.KGreyColor,
                    ),
                  ),
                ]),
          ),
        ));
  }
}

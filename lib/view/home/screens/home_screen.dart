import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/resources/color_manager.dart';

import '../widgets/custom_empty_body_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(70, 70),
              backgroundColor: ColorManager.KPrimaryColor,
              shape: const CircleBorder(),
            ),
            onPressed: () {},
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 24.sp,
              ),
            )),
        appBar: AppBar(
          title: Text(
            "Note",
            style: TextStyle(
              fontSize: 30.sp,
              fontFamily: "Otama",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: CustomEmptyBodyHomeScreen());
  }
}

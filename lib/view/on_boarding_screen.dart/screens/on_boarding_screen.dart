import 'package:flutter/material.dart';
import 'package:note_app/core/resources/color_manager.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(75, 75),
                backgroundColor: ColorManager.KPrimaryColor,
                shape: const CircleBorder(),
              ),
              onPressed: () {},
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 15,
              )),
        ),
        body: Container(
          width: double.infinity,
          child: Column(children: [
            const SizedBox(
              height: 125,
            ),
            Image.asset(
              "assets/images/on_boarding_png.png",
              width: 280,
              height: 280,
            )
          ]),
        ));
  }
}

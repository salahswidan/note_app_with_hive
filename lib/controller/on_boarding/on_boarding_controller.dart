import 'package:flutter/material.dart';

import '../../core/resources/route_manager.dart';

class OnBoardingController {
  void goToHomeScreen(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RoutesName.homeScreen, (route) => false);
  }
}

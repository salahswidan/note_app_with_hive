import 'package:flutter/material.dart';

import '../../view/on_boarding_screen.dart/screens/on_boarding_screen.dart';

class RouteName {
  RouteName._();
  static const String onBoardingScreen = '/onBoardingScreen';
}

class RoutesManager {
  RoutesManager._();
 static Map<String, WidgetBuilder> routes = {
    RouteName.onBoardingScreen: (context) => const OnBoardingScreen(),
  };
}

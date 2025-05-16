import 'package:flutter/material.dart';
import 'package:note_app/view/home/screens/home_screen.dart';
import 'package:note_app/view/new_note_screen/screen/new_note_screen.dart';
import 'package:note_app/view/not_found_route/screens/not_found_route_screen.dart';

import '../../view/on_boarding_screen.dart/screens/on_boarding_screen.dart';

class RoutesName {
  RoutesName._();

  static const String onBoardingScreen = '/';
  static const String homeScreen = '/homeScreen';
  static const String newNoteScreen = '/newNoteScreen';
}

class RoutesManager {
  RoutesManager._();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Widget body;
    switch (settings.name) {
      case RoutesName.onBoardingScreen:
        body = OnBoardingScreen();
        break;
          case RoutesName.homeScreen:
            body = HomeScreen();
            break;
          case RoutesName.newNoteScreen:
            body = NewNoteScreen();
            break;
          default:
            body = NotFoundRouteScreen();
            break;
        }
        return MaterialPageRoute(
          builder: (context) => body,
        );
    }
  
// static Map<String, WidgetBuilder> routes = {
//   RoutesName.onBoardingScreen: (context) => OnBoardingScreen(),
// };
}

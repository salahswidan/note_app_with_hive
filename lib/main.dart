import 'package:flutter/material.dart';

import 'core/resources/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.onBoardingScreen,
      routes: RoutesManager.routes,
     
      
      
    );
  }
}

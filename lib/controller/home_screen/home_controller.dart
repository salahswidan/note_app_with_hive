import 'package:flutter/material.dart';

import '../../core/resources/route_manager.dart';

class HomeController {
  BuildContext context;
  HomeController(this.context);

  void navigateToNewNoteScreen() {
    Navigator.of(context).pushNamed(RoutesName.newNoteScreen);
  }
}
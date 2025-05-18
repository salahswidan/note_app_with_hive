import 'package:flutter/material.dart';
import 'package:note_app/core/resources/consts_values.dart';

import '../../core/database/hive/hive_helper.dart';
import '../../core/resources/route_manager.dart';
import '../../model/note_model/note_model.dart';

class HomeController {
  BuildContext context;
  HomeController(this.context);

  void navigateToNewNoteScreen() {
    Navigator.of(context).pushNamed(RoutesName.newNoteScreen);
  }

  Future<void> getAllNotes() async {
    HiveHelper<NoteModel> hiveHelper = HiveHelper(ConstsValue.kNoteBox);
    print(await hiveHelper.getAllData());
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:note_app/core/resources/consts_values.dart';

import '../../core/database/hive/hive_helper.dart';
import '../../core/resources/route_manager.dart';
import '../../model/note_model/note_model.dart';

class HomeController {
  BuildContext context;
  HomeController(this.context) {
    start();
  }
  Future<void> start() async {
    await initController();
    await getAllNotes();
  }

  late StreamController<List<NoteModel>> _controllerNotes;
  late Sink<List<NoteModel>> _inputNotes;
  late Stream<List<NoteModel>> outputNotes;

  Future<void> initController() async {
    _controllerNotes = StreamController();
    _inputNotes = _controllerNotes.sink;
    outputNotes = _controllerNotes.stream;
  }

  Future<void> dispose() async {
    _controllerNotes.close();
    _inputNotes.close();
  }

  void goToNewNoteScreen() {
    Navigator.of(context).pushNamed(RoutesName.newNoteScreen).then((value) {
      getAllNotes();
    });
  }

  Future<void> getAllNotes() async {
    _inputNotes.add([]);
    HiveHelper<NoteModel> hiveHelper = HiveHelper(ConstsValue.kNoteBox);
    Map<dynamic, NoteModel> data = await hiveHelper.getAllData();

    _inputNotes.add(data.values.toList());
  }

  void onTapAtItemNote(NoteModel data) {
    Navigator.of(context)
        .pushNamed(RoutesName.newNoteScreen, arguments: data)
        .then((value) async{
     await getAllNotes();
    });
  }
}

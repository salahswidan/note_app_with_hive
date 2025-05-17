import 'package:flutter/material.dart';

class NewNoteController {
  BuildContext context;
  NewNoteController(this.context);
  void goBack(){
    Navigator.of(context).pop();
  }
}
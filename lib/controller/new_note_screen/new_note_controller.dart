// import 'package:flutter/material.dart';
// import 'package:note_app/core/database/hive/hive_helper.dart';
// import '../../model/note_model/note_model.dart';
// import '../../view/new_note_screen/widgets/bottom_sheet/custom_body_model_bottom_sheet_new_note.dart';

// class NewNoteController {
//   BuildContext context;

//   NewNoteController(this.context) {
//     initController();
//   }

//   late TextEditingController titleController;
//   late TextEditingController descController;

//   Future<void> initController() async {
//     titleController = TextEditingController();
//     descController = TextEditingController();
//   }

//   Future<void> disposeController() async {
//     titleController.dispose();
//     descController.dispose();
//   }

//   void goBack() {
//     Navigator.of(context).pop();
//   }

//   void checkRequiredData() {
//     addNewNote();
//   }

//   void addNewNote() {
//     if (titleController.text.trim().isEmpty || descController.text.isEmpty) {
//        onTapAtMarkIcon();
//     } else {
//       // Save the note
//       addNewNoteToHive();
//     }
//   }

//   Future<void> addNewNoteToHive() async {
//     int id = await getIdDefaultToNote();
//     id++;
//     NoteModel noteModel = NoteModel(
//         id: id,
//         title: titleController.text.trim(),
//         desc: descController.text.trim(),
//         dateTime: DateTime.now().toString(),
//         done: false);
//     HiveHelper<NoteModel> hiveHelper = HiveHelper("NoteBox");
//     await hiveHelper.addValue(key: id.toString(), value: noteModel);
//    await addIDDefaultToNote(id);
//     Navigator.of(context).pop();
//   }

// //! note
//   Future<int> getIdDefaultToNote() async {
//     HiveHelper<int> helper = HiveHelper("NoteId");
//     int? id = await helper.getValue(key: "id");
//     return id ?? 0; 
//   }
//   Future<void> addIDDefaultToNote(int id) async{
//     HiveHelper<int> helper = HiveHelper("NoteId");
//      await helper.addValue(key: "id", value: id);
//   } 
  

//   void onTapAtMarkIcon() {
//     FocusScope.of(context).unfocus();
//     showModalBottomSheet(
//       //  isDismissible: false,
//       backgroundColor: Colors.transparent,
//       context: context,
//       builder: (context) => CustomBodyModelBottomSheetNewNote(
//         onPressedClose: OnTapClosed,
//         onTapAtDeleteButton: onTapDelete,
//         onTapAtOkBytton: onTapOk,
//       ),
//     );
//   }

//   OnTapClosed() {
//     Navigator.of(context).pop();
//   }

//   onTapDelete() {
//     Navigator.of(context).pop();
//     Navigator.of(context).pop();
//   }

//   onTapOk() {
//     Navigator.of(context).pop();
//   }
// }


import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/core/database/hive/hive_helper.dart';
import 'package:note_app/model/note_model/note_model.dart';

import '../../core/resources/consts_values.dart';
import '../../view/new_note_screen/widgets/bottom_sheet/custom_body_model_bottom_sheet_new_note.dart';


class NewNoteController {
  BuildContext context;

  NewNoteController(this.context) {
    initController();
  }

  late TextEditingController titleController;
  late TextEditingController descController;

  Future<void> initController() async {
    titleController = TextEditingController();
    descController = TextEditingController();
  }

  Future<void> disposeController() async {
    titleController.dispose();
    descController.dispose();
  }

  void goBack() {
    Navigator.of(context).pop();
  }

  void onTapAtMarkIcon() {
    addNewNote();
  }

  void addNewNote() {
    //?add status========
    if (titleController.text.trim().isEmpty || descController.text.isEmpty) {
      //?now will show alert bottom sheet
      showAlertBottomSheet();
    } else {
      log("object");
      addNewNoteToHive();
      //?add data to hive
      //?close
    }
    //?=============
  }

  Future<void> addNewNoteToHive() async {
    int id = await getIdDefaultToNote();
    id++;
    NoteModel noteModel = NoteModel(
        id: id,
        title: titleController.text.trim(),
        desc: descController.text.trim(),
        dateTime: DateTime.now().toString(),
        done: false);

    HiveHelper<NoteModel> hiveHelper = HiveHelper(ConstsValue.kNoteBox);
    await hiveHelper.addValue(key: id.toString(), value: noteModel);
    //? now change value of default id
    await addIDDefaultToNote(id);
    //?return to main screen
    Navigator.of(context).pop();
  }

  Future<int> getIdDefaultToNote() async {
    HiveHelper<int> helper = HiveHelper(ConstsValue.kIDNoteBox);
    int? id = await helper.getValue(key: ConstsValue.kID);
    return id ?? 0;
  }

  Future<void> addIDDefaultToNote(int id) async {
    HiveHelper<int> helper = HiveHelper(ConstsValue.kIDNoteBox);
    await helper.addValue(key: ConstsValue.kID, value: id);
  }

  void showAlertBottomSheet() {
    FocusScope.of(context).unfocus();
    showModalBottomSheet(
      // isDismissible: false,
      backgroundColor: Colors.transparent,

      context: context,
      builder: (context) => CustomBodyModelBottomSheetNewNote(
        onTapAtDeleteButton: onTapAtDeleteButton,
        onTapAtOkBytton: onTapAtOkButton,
        onPressedClose: onPressedClosed,
      ),
    );
  }

  void onTapAtDeleteButton() {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  void onTapAtOkButton() {
    Navigator.of(context).pop();
  }

  void onPressedClosed() {
    Navigator.of(context).pop();
  }
}
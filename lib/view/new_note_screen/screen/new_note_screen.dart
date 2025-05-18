import 'package:flutter/material.dart';
import 'package:note_app/controller/new_note_screen/new_note_controller.dart';
import '../widgets/custom_app_bar_new_note_screen.dart';
import '../widgets/custom_text_field_desc_note.dart';
import '../widgets/custom_text_field_title_note.dart';

class NewNoteScreen extends StatefulWidget {
  const NewNoteScreen({super.key});

  @override
  State<NewNoteScreen> createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  late NewNoteController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = NewNoteController(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.disposeController();
    // _controller.titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 25.0, left: 25.0, top: 14),
          child: Column(
            children: [
              CustomAppBarNewNoteScreen(
                onPressedBack: () {
                  _controller.goBack();
                },
                onPressedAtMark: () {
                  _controller.onTapAtMarkIcon();
                },
              ),
              Expanded(
                child: Column(
                  children: [
                    CustomTextFieldTitle(
                      titleController: _controller.titleController,
                    ),
                    Expanded(
                      child: CustomTextFieldDescNote(
                        descController: _controller.descController,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

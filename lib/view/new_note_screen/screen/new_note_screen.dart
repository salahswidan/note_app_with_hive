import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/resources/color_manager.dart';

import '../widgets/custom_app_bar_new_note_screen.dart';

class NewNoteScreen extends StatelessWidget {
  const NewNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 25.0, left: 25.0, top: 14),
            child: Column(
              children: [
                CustomAppBarNewNoteScreen(
                  onPressedBack: () {
                    Navigator.of(context).pop();
                  },
                  onPressedAtMark: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

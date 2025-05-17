import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/controller/new_note_screen/new_note_controller.dart';
import 'package:note_app/core/resources/color_manager.dart';

import '../widgets/custom_app_bar_new_note_screen.dart';

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
                onPressedAtMark: () {},
              ),
              Form(
                  child: Expanded(
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 48.sp,
                        fontFamily: "Otama",
                      ),
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: "Title",
                        hintStyle: TextStyle(
                          color: ColorManager.KGrey2Color,
                          fontSize: 48.sp,
                          fontFamily: "Otama",
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 23.sp,
                          fontFamily: "Otama",
                        ),
                        maxLength: null,
                        decoration: InputDecoration(
                          hintText: "Type Something....",
                          hintStyle: TextStyle(
                            color: ColorManager.KGrey2Color,
                            fontSize: 23.sp,
                            fontFamily: "Otama",
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

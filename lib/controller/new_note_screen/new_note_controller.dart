import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/resources/color_manager.dart';
import 'package:note_app/main.dart';

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

  void checkRequiredData() {
    addNewNote();
  }

  void addNewNote() {
    if (titleController.text.trim().isEmpty ||
        descController.text.trim().isEmpty) {
      onTapAtMarkIcon();
    } else {
      // Save the note
    }
  }

  void onTapAtMarkIcon() {
    FocusScope.of(context).unfocus();
    showModalBottomSheet(
      //  isDismissible: false,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.only(
          top: 16.h,
        ),
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Text(
                      "Please fill in the required fields",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: "Otama",
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "To Save",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: "Otama",
                        fontWeight: FontWeight.bold,
                        color: ColorManager.KGrey2Color,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 41.w,
                ),
                IconButton.filled(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.KGrey2Color,
                  ),
                  onPressed: () {},
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Divider(
              height: 0,
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    InkWell(
                        child: Icon(
                      CupertinoIcons.check_mark_circled,
                      color: ColorManager.KPrimaryColor,
                    )),
                    Text(
                      "OK",
                      style: TextStyle(
                          color: ColorManager.KGrey2Color,
                          fontSize: 10.sp,
                          fontFamily: "Otama"),
                    ),
                  ],
                ),
                SizedBox(
                  width: 33.w,
                ),
                Column(
                  children: [
                    InkWell(
                        child: Icon(
                      CupertinoIcons.delete,
                      color: Colors.red,
                    )),
                    Text(
                      "Delete",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 10.sp,
                          fontFamily: "Otama"),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}

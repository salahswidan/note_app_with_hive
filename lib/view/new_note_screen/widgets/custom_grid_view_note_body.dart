import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/core/resources/color_manager.dart';
import 'package:note_app/model/note_model/note_model.dart';

import '../../home/widgets/custom_empty_body_home_screen.dart';

class CustomGridViewNoteBody extends StatelessWidget {
  const CustomGridViewNoteBody(
      {super.key,
      required this.outputlistNoteModel,
      required this.onTapAtNote});

  final Stream<List<NoteModel>> outputlistNoteModel;
  final void Function(NoteModel data) onTapAtNote;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NoteModel>>(
        stream: outputlistNoteModel,
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : snapshot.data == null
                ? SizedBox()
                : snapshot.data!.isEmpty
                    ? Center(
                        child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: CustomEmptyBodyHomeScreen()),
                      )
                    : GridView.builder(
                        padding: EdgeInsets.all(25.w),
                        itemCount: snapshot.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 146.h,
                          crossAxisCount: 2,
                          crossAxisSpacing: 11.w,
                          mainAxisSpacing: 9.h,
                        ),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            onTapAtNote(snapshot.data![index]);
                          },
                          child: CustomItemNote(
                            color: index % 5 == 0
                                ? ColorManager.listColorNotes[4]
                                : index % 4 == 0
                                    ? ColorManager.listColorNotes[3]
                                    : index % 3 == 0
                                        ? ColorManager.listColorNotes[2]
                                        : index % 2 == 0
                                            ? ColorManager.listColorNotes[1]
                                            : ColorManager.listColorNotes[0],
                            noteModel: snapshot.data![index],
                          ),
                        ),
                      ));
  }
}

class CustomItemNote extends StatelessWidget {
  const CustomItemNote({
    super.key,
    required this.noteModel,
    required this.color,
  });
  final NoteModel noteModel;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(children: [
                SvgPicture.asset("assets/images/background_id.svg"),
                Positioned(
                  right: 18.w,
                  top: 15,
                  child: Text(
                    noteModel.id.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontFamily: "Otama",
                    ),
                  ),
                ),
              ]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButtonDoneStatus(status: noteModel.done),
                  Text(noteModel.dateTime,
                      style: TextStyle(color: Colors.white, fontSize: 5.sp)),
                ],
              ),
            ],
          ),
          Text(noteModel.title,
              maxLines: 1,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontFamily: "Otama",
                  fontWeight: FontWeight.w700)),
          SizedBox(
            height: 4.h,
          ),
          Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            noteModel.desc,
            style: TextStyle(
              color: ColorManager.KGrey2Color,
              fontSize: 8.sp,
              fontFamily: "Otama",
            ),
          )
        ],
      ),
    );
  }
}

class ElevatedButtonDoneStatus extends StatelessWidget {
  const ElevatedButtonDoneStatus({
    super.key,
    required this.status,
  });

  final bool status;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              status == true ? Color(0xff02463d) : Color(0xfff7dee3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        onPressed: () {},
        label: Text(
          status == true ? "Done" : "Not Done",
          style: TextStyle(
              fontFamily: "Otama",
              color: status == true ? Colors.white : Colors.red,
              fontSize: 8.sp),
        ),
        icon: Icon(
          status == true
              ? CupertinoIcons.checkmark_alt_circle_fill
              : Icons.clear_rounded,
          color: status == true ? ColorManager.KLightGreenColor : Colors.red,
        ));
  }
}

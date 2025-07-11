import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/controller/home_screen/home_controller.dart';
import '../../new_note_screen/widgets/custom_grid_view_note_body.dart';
import '../widgets/custom_empty_body_home_screen.dart';
import '../widgets/custom_floating_action_button_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = HomeController(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: CustomFloatingActionButton(
          onPressed: () {
            _controller.goToNewNoteScreen();
          },
        ),
        appBar: AppBar(
          title: Text(
            "Note",
            style: TextStyle(
              fontSize: 30.sp,
              fontFamily: "Otama",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: RefreshIndicator(
            onRefresh: () async {
              _controller.getAllNotes();
            },
            child: CustomGridViewNoteBody(
              onTapAtNote: _controller.onTapAtItemNote,
              outputlistNoteModel: _controller.outputNotes,
            )));
  }
}

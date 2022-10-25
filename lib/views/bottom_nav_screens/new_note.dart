import 'package:flutter/material.dart';
import 'package:google_keep/utils/modalbottom_sheet.dart';
import 'package:google_keep/utils/notesappbar.dart';

class NewNote extends StatefulWidget {
  static const routeName = '/new-note';
  const NewNote({Key? key}) : super(key: key);

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.055,
                  ),
                  notesAppBar(),
                  SizedBox(
                    height: 29,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              hintText: "Title",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              border: InputBorder.none),
                          maxLines: null,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              hintText: "Note",
                              hintStyle: TextStyle(fontSize: 16),
                              border: InputBorder.none),
                          maxLines: null,
                        )
                      ],
                    ),
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(child: Icon(Icons.format_paint_sharp)),
                    GestureDetector(child: Text("Edited 11:56 am")),
                    GestureDetector(
                        onTap: () {
                          bottomSheet(context);
                        },
                        child: Icon(Icons.more_vert))
                  ],
                )),
          )
        ],
      ),
    ));
  }
}

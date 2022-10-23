import 'package:flutter/material.dart';

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
        body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 8.0),
          child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.055,
                  ),
                  Row(
                    children: [
                      GestureDetector(child: Icon(Icons.arrow_back)),
                      Spacer(),
                      GestureDetector(child: Icon(Icons.push_pin_outlined)),
                      SizedBox(
                        width: 15.0,
                      ),
                      GestureDetector(
                          child: Icon(Icons.notification_add_outlined)),
                      SizedBox(
                        width: 15.0,
                      ),
                      GestureDetector(child: Icon(Icons.archive_outlined))
                    ],
                  ),
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
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 14.0),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.format_paint_sharp),
                  Text("Edited 11:56 am"),
                  Icon(Icons.more_vert)
                ],
              )),
        )
      ],
    ));
  }
}

  //  Padding(
  //     padding: const EdgeInsets.only(left: 12.0, right: 8.0),
  //     child: Column(
  //       children: [
  //         SizedBox(
  //           height: size.height * 0.055,
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.only(bottom: 20),
  //           child: Row(
  //             children: [
  //               GestureDetector(child: Icon(Icons.arrow_back)),
  //               Spacer(),
  //               GestureDetector(child: Icon(Icons.push_pin_outlined)),
  //               SizedBox(
  //                 width: 15.0,
  //               ),
  //               GestureDetector(child: Icon(Icons.notification_add_outlined)),
  //               SizedBox(
  //                 width: 15.0,
  //               ),
  //               GestureDetector(child: Icon(Icons.archive_outlined))
  //             ],
  //           ),
  //         ),
  //         TextField(
  //           decoration: InputDecoration(
  //               hintText: "Title",
  //               hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
  //               border: InputBorder.none),
  //           maxLines: null,
  //         ),
  //         TextField(
  //           decoration: InputDecoration(
  //               hintText: "Note",
  //               hintStyle: TextStyle(fontSize: 16),
  //               border: InputBorder.none),
  //           maxLines: null,
  //         )
  //       ],
  //     ),
  //   )




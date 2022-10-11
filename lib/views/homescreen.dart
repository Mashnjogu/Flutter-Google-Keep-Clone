import 'package:flutter/material.dart';
import 'package:google_keep/views/bottom_nav_screens/canvas_screen.dart';
import 'package:google_keep/views/bottom_nav_screens/capture_image.dart';
import 'package:google_keep/views/bottom_nav_screens/list_screen.dart';
import 'package:google_keep/views/bottom_nav_screens/record_audio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageStorageBucket bucket = PageStorageBucket();
  final List<Widget> bottomNavigationScreens = [
    CanvasScreen(),
    CaptureImageScreen(),
    ListScreen(),
    RecordAudioScreen()
  ];
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        key: _drawerKey,
        body: ListView(
          children: [
            SafeArea(
                child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 18),
              child: Column(
                children: [KeepAppBar(size, context)],
              ),
            ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // MaterialButton(
                    //     // minWidth: 40,
                    //     onPressed: () {
                    //       setState(() {});
                    //     },
                    //     child: Icon(Icons.check_box_outlined)),
                    // MaterialButton(
                    //     // minWidth: 40,
                    //     onPressed: () {
                    //       setState(() {});
                    //     },
                    //     child: Icon(Icons.brush_outlined)),
                    // MaterialButton(
                    //     // minWidth: 40,
                    //     onPressed: () {
                    //       setState(() {});
                    //     },
                    //     child: Icon(Icons.mic)),
                    // MaterialButton(
                    //     // minWidth: 40,
                    //     onPressed: () {
                    //       setState(() {});
                    //     },
                    //     child: Icon(Icons.image_outlined)),

                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 8),
                      child: GestureDetector(
                          child: Icon(Icons.check_box_outlined)),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 8),
                      child: GestureDetector(
                        child: Icon(Icons.brush_outlined),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 8),
                      child: GestureDetector(
                        child: Icon(Icons.mic),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 8),
                      child: GestureDetector(
                        child: Icon(Icons.image_outlined),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Container KeepAppBar(Size size, BuildContext context) {
    return Container(
      width: size.width,
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Theme.of(context).brightness == Brightness.light
              ? Color.fromRGBO(242, 248, 251, 0.85)
              : Colors.black26,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 0))
          ]),
      child: RawMaterialButton(
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.only(right: 10, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  _drawerKey.currentState!.openDrawer();
                },
                child: Icon(Icons.menu),
              ),
              const SizedBox(
                width: 20,
              ),
              const Text(
                "Search your notes",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  _drawerKey.currentState!.openDrawer();
                },
                child: Icon(Icons.view_list),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 40,
                child: RawMaterialButton(
                  onPressed: () {},
                  child: const CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(
                      "D",
                      style: TextStyle(fontSize: 19, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

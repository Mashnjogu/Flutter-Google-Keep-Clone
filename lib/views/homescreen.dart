import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    );
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

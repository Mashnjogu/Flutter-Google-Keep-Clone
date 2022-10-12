import 'package:flutter/material.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.085,
        ),
        Text("Google Keep"),
        GestureDetector(
          child: Row(
            children: [Icon(Icons.lightbulb_outline), Text("Notes")],
          ),
        ),
        GestureDetector(
          child: Row(
            children: [Icon(Icons.notifications_outlined), Text("Reminders")],
          ),
        ),
        // Divider(
        //   thickness: 2,
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [Text("Label"), Text("Edit")],
        // )
        GestureDetector(
          child: Row(
            children: [Icon(Icons.add), Text("Create new label")],
          ),
        ),
        GestureDetector(
          child: Row(
            children: [Icon(Icons.archive_outlined), Text("Archive")],
          ),
        ),
        GestureDetector(
          child: Row(
            children: [Icon(Icons.delete_outline_sharp), Text("Delete")],
          ),
        ),
        GestureDetector(
          child: Row(
            children: [Icon(Icons.settings), Text("Settings")],
          ),
        ),
        GestureDetector(
          child: Row(
            children: [
              Icon(Icons.help_outline_rounded),
              Text("Help & feedback")
            ],
          ),
        ),
      ],
    );
  }
}

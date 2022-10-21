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
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Align(
              alignment: Alignment.bottomLeft, child: Text("Google Keep")),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 14.0, bottom: 10, top: 10),
          child: GestureDetector(
            child: Row(
              children: [
                Icon(Icons.lightbulb_outline),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("Notes"),
                )
              ],
            ),
          ),
        ),
        paddingOnDrawerItems("Reminders", Icons.notifications_outlined, () {}),
        // Divider(
        //   thickness: 2,
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [Text("Label"), Text("Edit")],
        // )
        paddingOnDrawerItems("Create new Label", Icons.add, () {}),
        paddingOnDrawerItems("Archive", Icons.archive_outlined, () {}),
        paddingOnDrawerItems("Delete", Icons.delete_outline_sharp, () {}),
        paddingOnDrawerItems("Settigs", Icons.settings, () {}),
        paddingOnDrawerItems(
            "Help & feedback", Icons.help_outline_rounded, () {})
      ],
    );
  }

  Padding paddingOnDrawerItems(String text, IconData icon, Function onTapped) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0, bottom: 10, top: 10),
      child: GestureDetector(
        onTap: () => onTapped,
        child: Row(
          children: [
            Icon(icon),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(text),
            )
          ],
        ),
      ),
    );
  }
}

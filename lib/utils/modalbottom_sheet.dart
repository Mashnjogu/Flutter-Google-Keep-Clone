import 'package:flutter/material.dart';

Future<dynamic> bottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            bottomSheetItem(
                itemName: "Delete", itemIcon: Icons.delete, onTapped: () {}),
            bottomSheetItem(
                itemName: "Make a copy",
                itemIcon: Icons.copy_sharp,
                onTapped: () {}),
            bottomSheetItem(
                itemName: "Send", itemIcon: Icons.share, onTapped: () {}),
            bottomSheetItem(
                itemName: "Collaborator",
                itemIcon: Icons.person_add,
                onTapped: () {}),
            bottomSheetItem(
                itemName: "Labels",
                itemIcon: Icons.label_important_outline_sharp,
                onTapped: () {})
          ],
        );
      });
}

Row bottomSheetItem(
    {required String itemName,
    required IconData itemIcon,
    required Function onTapped}) {
  return Row(
    children: [
      GestureDetector(onTap: () => onTapped, child: Icon(itemIcon)),
      Text(itemName)
    ],
  );
}

import 'package:flutter/material.dart';

class notesAppBar extends StatelessWidget {
  const notesAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back)),
        Spacer(),
        GestureDetector(child: Icon(Icons.push_pin_outlined)),
        SizedBox(
          width: 15.0,
        ),
        GestureDetector(child: Icon(Icons.notification_add_outlined)),
        SizedBox(
          width: 15.0,
        ),
        GestureDetector(child: Icon(Icons.archive_outlined))
      ],
    );
  }
}

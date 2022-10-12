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
    return Scaffold(
      body: Center(
        child: Text("NewNote"),
      ),
    );
  }
}

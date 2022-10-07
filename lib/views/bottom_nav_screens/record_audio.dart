import 'package:flutter/material.dart';

class RecordAudioScreen extends StatefulWidget {
  const RecordAudioScreen({Key? key}) : super(key: key);

  @override
  State<RecordAudioScreen> createState() => _RecordAudioScreenState();
}

class _RecordAudioScreenState extends State<RecordAudioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "RecordAudio Screen",
          style: TextStyle(fontSize: 21),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CaptureImageScreen extends StatefulWidget {
  static const routeName = '/capture-image';
  const CaptureImageScreen({Key? key}) : super(key: key);

  @override
  State<CaptureImageScreen> createState() => _CaptureImageScreenState();
}

class _CaptureImageScreenState extends State<CaptureImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "CaptureImage Screen",
          style: TextStyle(fontSize: 21),
        ),
      ),
    );
  }
}

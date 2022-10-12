import 'package:flutter/material.dart';

class CanvasScreen extends StatefulWidget {
  static const routeName = '/new-canvas';
  const CanvasScreen({Key? key}) : super(key: key);

  @override
  State<CanvasScreen> createState() => _CanvasScreenState();
}

class _CanvasScreenState extends State<CanvasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Canvas Screen",
          style: TextStyle(fontSize: 21),
        ),
      ),
    );
  }
}

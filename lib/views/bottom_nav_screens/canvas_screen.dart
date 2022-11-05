import 'package:flutter/material.dart';

class CanvasScreen extends StatefulWidget {
  static const routeName = '/new-canvas';
  const CanvasScreen({Key? key}) : super(key: key);

  @override
  State<CanvasScreen> createState() => _CanvasScreenState();
}

class _CanvasScreenState extends State<CanvasScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Canvas Screen"),
        actions: [],
      ),
      body: Container(
        child: CustomPaint(
          painter: MyCustomPainter(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.crop_square_outlined), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.emergency_share_rounded), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.brush), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.bus_alert_sharp), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.festival_sharp), label: ""),
        ],
        onTap: ((index) {
          setState(() {
            _currentIndex = index;
          });
        }),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset startingPoint = Offset(0, 0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

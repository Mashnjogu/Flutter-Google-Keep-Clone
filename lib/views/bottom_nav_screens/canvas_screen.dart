import 'dart:ui';

import 'package:flutter/material.dart';

class CanvasScreen extends StatefulWidget {
  static const routeName = '/new-canvas';
  const CanvasScreen({Key? key}) : super(key: key);

  @override
  State<CanvasScreen> createState() => _CanvasScreenState();
}

class _CanvasScreenState extends State<CanvasScreen> {
  int _currentIndex = 0;
  List<Offset?> points = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Canvas Screen"),
        actions: [],
      ),
      body: GestureDetector(
        onPanDown: ((details) {
          setState(() {
            points.add(details.localPosition);
          });
        }),
        onPanEnd: ((details) {
          setState(() {
            points.add(null);
          });
        }),
        onPanUpdate: ((details) {
          setState(() {
            points.add(details.localPosition);
          });
        }),
        child: Container(
          child: CustomPaint(
            painter: MyCustomPainter(points: points),
          ),
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
  List<Offset?> points;
  MyCustomPainter({required this.points});
  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color = Colors.white;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);

    Paint paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 2.0;
    paint.isAntiAlias = true;
    paint.strokeCap = StrokeCap.round;

    for (int x = 0; x < points.length - 1; x++) {
      if (points[x] != null && points[x + 1] != null) {
        canvas.drawLine(points[x]!, points[x + 1]!, paint);
      } else if (points[x] != null && points[x + 1] == null) {
        canvas.drawPoints(PointMode.points, [points[x]!], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

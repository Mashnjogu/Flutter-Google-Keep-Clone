import 'package:flutter/material.dart';
import 'package:google_keep/views/bottom_nav_screens/canvas_screen.dart';
import 'package:google_keep/views/bottom_nav_screens/capture_image.dart';
import 'package:google_keep/views/bottom_nav_screens/list_screen.dart';
import 'package:google_keep/views/bottom_nav_screens/new_note.dart';
import 'package:google_keep/views/bottom_nav_screens/record_audio.dart';
import 'package:google_keep/views/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: HomeScreen(),
      routes: {
        NewNote.routeName: (ctx) => NewNote(),
        CanvasScreen.routeName: (ctx) => CanvasScreen(),
        CaptureImageScreen.routeName: (ctx) => CaptureImageScreen(),
        ListScreen.routeName: (ctx) => ListScreen(),
        RecordAudioScreen.routeName: (ctx) => RecordAudioScreen()
      },
    );
  }
}

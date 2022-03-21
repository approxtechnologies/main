import 'package:flutter/material.dart';
import 'package:live_cricket_score/Pages/HomeWigets/Home_Pages.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        routes: {
          "/": (context) => Home_Page(),
        },
      ),
    );
  }
}

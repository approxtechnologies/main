import 'package:flutter/material.dart';
import 'package:live_cricket_score/Pages/HomeWigets/Home_Pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       routes: {
        "/": (context) => Home_Page(),
      },
    );
  }
}

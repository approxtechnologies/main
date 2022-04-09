import 'package:flutter/material.dart';
import 'package:shreejidigitalartdesktop/screens/MainScreen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("response mian");
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
              DeviceType deviceType) =>
          MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => MainScreen(),
        },
      ),
    );
  }
}

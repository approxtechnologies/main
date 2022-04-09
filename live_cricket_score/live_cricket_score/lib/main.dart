import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:live_cricket_score/MainWidgets/Themes.dart';
import 'package:live_cricket_score/SplashScreen.dart';
import 'package:sizer/sizer.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(

    statusBarColor: Color(0XFF2F90D1), // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        theme: MyThemes.lightTheme(context),
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => SplashScreen(),
        },
      ),
    );
  }
}
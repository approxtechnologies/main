import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:live_cricket_score/SplashScreen.dart';
import 'package:live_cricket_score/adwidgets/native_inline_page.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class ExitDialog extends StatelessWidget {
  const ExitDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/images/exit_icon.svg",
                height: 50,
                width: 50,
              ),
              Container(
                height: 40,
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Exit Dialog",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                ),
              )
            ],
          ),
          alignment: Alignment.center,
        ),

        NativeInlinePage(),
       /* SizedBox(
          height: 20,
        ),
       // Text("Are you sure you want to exit this app?"),
        SizedBox(
          height: 20,
        ),*/
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  FlatButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      exit(0);
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        "Yes",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ).expand(),
              Container(
                width: 10,
              ),
              Column(
                children: [
                  FlatButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        "No",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ).expand()
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          height: 130,
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
        SizedBox(height: 20),
        Text("Are you sure you want to exit this app?"),
        SizedBox(height: 20),
        Container(
            height: 200,
            child: SingleChildScrollView(
              child: Column(
                children: [
              NativeInlinePage(),
                ],
              ),
            )),
        Container(
          height: 1.h,
          width: 100.w,
        ),
        Column(
          children: [
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Theme.of(context).primaryColor)),
                        // color: Theme.of(context).primaryColor,
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          color: Theme.of(context).primaryColor,
                          child: Text(
                            "Yes",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ).expand(),
                  Container(
                    width: 1.w,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Theme.of(context).primaryColor)),
                        // color: Theme.of(context).primaryColor,
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
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ).expand()
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        )
      ],
    );
  }
}

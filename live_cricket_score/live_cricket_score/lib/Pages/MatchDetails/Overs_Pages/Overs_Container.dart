import 'package:flutter/material.dart';
import 'package:live_cricket_score/MainWidgets/Themes.dart';

import 'package:live_cricket_score/models/OversModel.dart';
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class Overs_Container extends StatelessWidget {
  final OverSep overSep;

  const Overs_Container({
    Key? key,
    required this.overSep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String s = "";
    for (int i = 0; i < overSep.ovrBatNames!.length; i++)
      s += overSep.ovrBatNames![i] + " ";

    var balls = overSep.overSummary!.split(" ");
    return Container(
      padding: EdgeInsets.all(1.w),
      child: Column(children: [
        Row(
          children: [
            Column(
              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Ov ${overSep.overNum!.toInt() + 1}",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                        width: 80,
                      ),
                      Text("${Utils.cheaknull(overSep.runs)} runs",
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade500)),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${overSep.ovrBowlNames} to ${s}",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < balls.length - 1; i++)
                        getBall(balls[i])
                    ],
                  ),
                )
              ],
            ).expand()
          ],
        ),
        Container(
          height: 1,
          width: 99.w,
          color: MyThemes.divaidarColor,
        )
      ]),
    );
  }

  Widget getBall(String string) {
    switch (string) {
      case "1":
      case "2":
      case "3":
        return Container(
          margin: EdgeInsets.all(5),
          child: Text(string, style: TextStyle(color: Colors.white)),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.green),
          padding: EdgeInsets.all(8),
        );

      case "4":
        return Container(
          margin: EdgeInsets.all(5),
          child: Text(string, style: TextStyle(color: Colors.white)),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.blue.shade300),
          padding: EdgeInsets.all(8),
        );

      case "6":
        return Container(
          margin: EdgeInsets.all(5),
          child: Text(string, style: TextStyle(color: Colors.white)),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.purple.shade300),
          padding: EdgeInsets.all(8),
        );

      case "W":
        return Container(
          margin: EdgeInsets.all(5),
          child:
              Text(string, style: TextStyle(color: Colors.white, fontSize: 12)),
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          padding: EdgeInsets.all(6),
        );

      case "Wd":
      case "Wd1":
      case "Wd3":
      case "Wd4":
      case "Wd2":
      case "L1":
      case "L3":
      case "L2":
      case "L4":
      case "B1":
      case "B2":
      case "B3":
      case "B4":
      case "N":
      case "N1":
      case "N2":
      case "N3":
      case "N4":
      case "N5":
      case "N6":
        return Container(
          margin: EdgeInsets.all(5),
          child:
              Text(string, style: TextStyle(color: Colors.white, fontSize: 12)),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.yellow.shade700),
          padding: EdgeInsets.all(6),
        );

      default:
        return Container(
          margin: EdgeInsets.all(5),
          child: Text(
            string,
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.grey.shade400),
          padding: EdgeInsets.all(8),
        );
    }
  }
}

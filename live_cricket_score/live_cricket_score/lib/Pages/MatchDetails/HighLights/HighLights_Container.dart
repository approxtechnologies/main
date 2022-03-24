import 'package:flutter/material.dart';
import 'package:live_cricket_score/MainWidgets/Themes.dart';

import 'package:live_cricket_score/models/HighLightsModel.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class HighLights_Container extends StatelessWidget {
  final CommentaryLines data;

  const HighLights_Container({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 2.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 3.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${data.commentary!.overNum}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                getBall(data.commentary!.eventType!)
              ],
            ),
            SizedBox(
              width: 4.w,
            ),
            Container(
              width: 73.w,
              child: Text(getTextCommantry(data.commentary!.commtxt!)),
            ),
            SizedBox(
              width: 3.w,
            ),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          height: 1,
          width: 99.w,
          color: MyThemes.divaidarColor,
        )
      ],
    );
  }

  Widget getBall(String string) {
    switch (string) {
      case "FOUR":
      case "over-break,FOUR":
        return Container(
          margin: EdgeInsets.all(5),
          child: Text(
            "4",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.blue.shade300),
          padding: EdgeInsets.all(8),
        );

      case "SIX":
      case "over-break,SIX":
        return Container(
          margin: EdgeInsets.all(5),
          child: Text(
            "6",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.purple.shade300),
          padding: EdgeInsets.all(8),
        );

      case "WICKET":
      case "over-break,WICKET":
        return Container(
          margin: EdgeInsets.all(5),
          child: Text(
            "W",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          padding: EdgeInsets.all(8),
        );

      case "FIFTY":
      case "over-break,FIFTY":
        return Container(
          margin: EdgeInsets.all(5),
          child: Text(
            "F",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.yellow.shade700),
          padding: EdgeInsets.all(8),
        );

      case "HUNDRED":
      case "over-break,HUNDRED":
        return Container(
          margin: EdgeInsets.all(5),
          child: Text(
            "C",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.green.shade400),
          padding: EdgeInsets.all(8),
        );

      default:
        return Container();
    }
  }

  String getTextCommantry(String s) {
    if (data.commentary!.commentaryFormats != null &&
        data.commentary!.commentaryFormats!.length > 1) {
      if (data.commentary!.commentaryFormats![1].type == "bold") {
        if (data.commentary!.commentaryFormats![1].value != null) {
          for (int i = 0;
              i < data.commentary!.commentaryFormats![1].value!.length;
              i++)
            s.replaceAll(
                data.commentary!.commentaryFormats![1].value![i].id.toString(),
                data.commentary!.commentaryFormats![1].value![i].value
                    .toString());
        }
      }
    }
    return s;
  }
}

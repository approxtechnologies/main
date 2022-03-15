import 'package:flutter/material.dart';

import 'package:live_cricket_score/models/HighLightsModel.dart';
import 'package:velocity_x/velocity_x.dart';

class HighLights_Container extends StatelessWidget {
  final CommentaryLines data;

  const HighLights_Container({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  "${data.commentary!.overNum}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: getBall(data.commentary!.eventType!),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(getTextCommantry(data.commentary!.commtxt!)),
            ],
          ).expand(),
        ],
      ),
    );
  }

  Widget getBall(String string) {
    switch (string) {
      case "FOUR":
      case "over-break,FOUR":
        return Container(
          margin: EdgeInsets.all(5),
          child: Text("4"),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.blue.shade300),
          padding: EdgeInsets.all(5),
        );

      case "SIX":
      case "over-break,SIX":
        return Container(
          margin: EdgeInsets.all(5),
          child: Text("6"),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.purple.shade300),
          padding: EdgeInsets.all(5),
        );

      case "WICKET":
      case "over-break,WICKET":
        return Container(
          margin: EdgeInsets.all(5),
          child: Text("W"),
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          padding: EdgeInsets.all(5),
        );

      case "FIFTY":
      case "over-break,FIFTY":
        return Container(
          margin: EdgeInsets.all(5),
          child: Text("F"),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.yellow.shade700),
          padding: EdgeInsets.all(5),
        );

      case "HUNDRED":
      case "over-break,HUNDRED":
        return Container(
          margin: EdgeInsets.all(5),
          child: Text("C"),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.green.shade400),
          padding: EdgeInsets.all(5),
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

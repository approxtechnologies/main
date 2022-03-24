import 'package:flutter/material.dart';
import 'package:live_cricket_score/MainWidgets/Themes.dart';
import 'package:live_cricket_score/models/ScorBoardModel.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class TableBowerRow {
  final bowler;
  final index;

  TableBowerRow(this.bowler, this.index);

  @override
  TableRow build(BuildContext context) {
    return TableRow(
      decoration:
          BoxDecoration(color: index % 2 == 0 ? Colors.white : MyThemes.grey),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${bowler.name}",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: MyThemes.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.5.h),
          child: Text(
            "${bowler.overs}",
            textAlign: TextAlign.center,
            style: TextStyle(color: MyThemes.textColor, fontSize: 14),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.5.h),
          child: Text(
            "${cheaknull(bowler.maidens)}",
            textAlign: TextAlign.center,
            style: TextStyle(color: MyThemes.textColor, fontSize: 12),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.5.h),
          child: Text(
            "${cheaknull(bowler.runs)}",
            textAlign: TextAlign.center,
            style: TextStyle(color: MyThemes.textColor, fontSize: 12),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.5.h),
          child: Text(
            "${cheaknull(bowler.wickets)}",
            textAlign: TextAlign.center,
            style: TextStyle(color: MyThemes.textColor, fontSize: 12),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.5.h),
          child: Text(
            "${bowler.economy}",
            textAlign: TextAlign.center,
            style: TextStyle(color: MyThemes.textColor, fontSize: 12),
          ),
        ),
      ],
    );
  }

  int cheaknull(var d) {
    if (d != null) {
      if (d > 0)
        return d;
      else
        return 0;
    } else
      return 0;
  }
}

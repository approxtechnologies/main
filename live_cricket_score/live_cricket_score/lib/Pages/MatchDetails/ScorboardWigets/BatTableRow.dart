import 'package:flutter/material.dart';
import 'package:live_cricket_score/MainWidgets/Themes.dart';
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class TableOwnRow {
  final batsman;
  final index;

  TableOwnRow(this.batsman, this.index);

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
                "${batsman.name}",
                style: TextStyle(
                    color: MyThemes.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              if (batsman.outDec != null)
                Text(
                  "${batsman.outDec}",
                  style: TextStyle(color: MyThemes.textColor, fontSize: 10),
                )
              else
                Text(
                  "Did not bat",
                  style: TextStyle(color: MyThemes.textColor, fontSize: 10),
                ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.5.h),
          child: Text(
            "${Utils.cheaknull(batsman.runs)}",
            textAlign: TextAlign.center,
            style: TextStyle(color: MyThemes.textColor, fontSize: 12),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.5.h),
          child: Text(
            "${Utils.cheaknull(batsman.balls)}",
            textAlign: TextAlign.center,
            style: TextStyle(color: MyThemes.textColor, fontSize: 12),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.5.h),
          child: Text(
            "${Utils.cheaknull(batsman.fours)}",
            textAlign: TextAlign.center,
            style: TextStyle(color: MyThemes.textColor, fontSize: 12),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.5.h),
          child: Text(
            "${Utils.cheaknull(batsman.sixes)}",
            textAlign: TextAlign.center,
            style: TextStyle(color: MyThemes.textColor, fontSize: 12),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.5.h),
          child: Text(
            "${batsman.strkRate}",
            textAlign: TextAlign.center,
            style: TextStyle(color: MyThemes.textColor, fontSize: 12),
          ),
        ),
      ],
    );
  }
}

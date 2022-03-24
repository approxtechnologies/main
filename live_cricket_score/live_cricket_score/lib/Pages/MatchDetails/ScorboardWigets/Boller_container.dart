import 'package:flutter/material.dart';
import 'package:live_cricket_score/MainWidgets/Themes.dart';
import 'package:live_cricket_score/Pages/MatchDetails/ScorboardWigets/BatTableRow.dart';
import 'package:live_cricket_score/Pages/MatchDetails/ScorboardWigets/BolTableRow.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:live_cricket_score/models/ScorBoardModel.dart';

class Bower_Container extends StatelessWidget {
  final List<Bowler> bowler;
  const Bower_Container({
    Key? key,
    required this.bowler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Table(
        border: TableBorder.symmetric(
            inside: BorderSide(width: 1, color: MyThemes.divaidarColor)),
        columnWidths: {
          0: FractionColumnWidth(.42),
          1: FractionColumnWidth(.10),
          2: FractionColumnWidth(.1),
          3: FractionColumnWidth(.1),
          4: FractionColumnWidth(.1),
          5: FractionColumnWidth(.18)
        },
        children: [
          TableRow(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  child: Text(
                    "Bowler",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
                  alignment: Alignment.center,
                  child:
                      Text("O", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
                    alignment: Alignment.center,
                    child: Text("M",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
                    alignment: Alignment.center,
                    child: Text("R",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
                    alignment: Alignment.center,
                    child: Text("W",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                    alignment: Alignment.center,
                    child: Text("ER",
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ]),
          for (int i = 0; i < bowler.length; i++)
            TableBowerRow(bowler[i], i).build(context),
        ],
      ),
    );
  }
}

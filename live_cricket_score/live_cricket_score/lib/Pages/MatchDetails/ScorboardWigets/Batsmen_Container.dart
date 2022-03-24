import 'package:flutter/material.dart';
import 'package:live_cricket_score/MainWidgets/Themes.dart';
import 'package:live_cricket_score/Pages/MatchDetails/ScorboardWigets/BatTableRow.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:live_cricket_score/models/ScorBoardModel.dart';

class Batsmen_Container extends StatelessWidget {
  final List<Batsman> batsman;
  const Batsmen_Container({
    Key? key,
    required this.batsman,
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
                color: MyThemes.grey,
              ),
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  child: Text("Batter",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
                  child: Text("R",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
                    child: Text("B",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
                    child: Text("4s",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
                    child: Text("6s",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                    child: Text("SR",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ]),
          for (int i = 0; i < batsman.length; i++)
            TableOwnRow(batsman[i], i).build(context),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:live_cricket_score/MainWidgets/Themes.dart';
import 'package:live_cricket_score/Pages/MatchDetails/ScorboardWigets/FowTableRow.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:live_cricket_score/Pages/MatchDetails/ScorboardWigets/BatTableRow.dart';
import 'package:live_cricket_score/Pages/MatchDetails/ScorboardWigets/BolTableRow.dart';
import 'package:live_cricket_score/models/ScorBoardModel.dart';

class Fow_Container extends StatelessWidget {
  final List<Fow> fow;

  const Fow_Container({
    Key? key,
    required this.fow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Table(
        border: TableBorder.symmetric(
            inside: BorderSide(width: 1, color: MyThemes.divaidarColor)),
        columnWidths: {
          0: FractionColumnWidth(.60),
          1: FractionColumnWidth(.20),
          2: FractionColumnWidth(.20),
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
                    "Fall of Wickets",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
                  alignment: Alignment.center,
                  child: Text("Score",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                    alignment: Alignment.center,
                    child: Text("Over",
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ]),
          for (int i = 0; i < fow.length; i++)
            FowTableRow(fow[i], i).build(context),
        ],
      ),
    );
  }
}

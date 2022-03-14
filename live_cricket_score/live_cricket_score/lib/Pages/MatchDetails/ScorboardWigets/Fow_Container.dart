import 'package:flutter/material.dart';
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
    return Table(
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
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 8.0,
                  top: 8.0,
                  bottom: 8.0,
                ),
                child: Text("Fall of Wickets"),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                alignment: Alignment.centerRight,
                child: Text("Score"),
              ),
              Container(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
                  alignment: Alignment.centerRight,
                  child: Text("Over")),
            ]),
        for (int i = 0; i < fow.length; i++) FowTableRow(fow[i]).build(context),
      ],
    );
  }
}

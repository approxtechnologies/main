import 'package:flutter/material.dart';
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
    return Table(
      columnWidths: {
        0: FractionColumnWidth(.50),
        1: FractionColumnWidth(.09),
        2: FractionColumnWidth(.09),
        3: FractionColumnWidth(.09),
        4: FractionColumnWidth(.09),
        5: FractionColumnWidth(.14)
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
                child: Text("Batter"),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text("R", textAlign: TextAlign.end),
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("B", textAlign: TextAlign.end)),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("4s", textAlign: TextAlign.end)),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("6s", textAlign: TextAlign.end)),
              Container(
                  padding:
                      const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
                  child: Text("SR", textAlign: TextAlign.end)),
            ]),
        for (int i = 0; i < batsman.length; i++)
          TableOwnRow(batsman: batsman[i]).build(context),
      ],
    );
  }
}

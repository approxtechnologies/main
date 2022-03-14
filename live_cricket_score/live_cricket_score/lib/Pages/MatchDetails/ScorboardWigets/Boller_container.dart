import 'package:flutter/material.dart';
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
                child: Text("Bowler"),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                alignment: Alignment.centerRight,
                child: Text("O"),
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  alignment: Alignment.centerRight,
                  child: Text("M")),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  alignment: Alignment.centerRight,
                  child: Text("R")),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  alignment: Alignment.centerRight,
                  child: Text("W")),
              Container(
                  padding: EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
                  alignment: Alignment.centerRight,
                  child: Text("ER")),
            ]),
        for (int i = 0; i < bowler.length; i++)
          TableBowerRow(bowler[i]).build(context),
      ],
    );
  }
}

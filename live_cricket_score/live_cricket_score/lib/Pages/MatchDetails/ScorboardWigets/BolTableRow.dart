import 'package:flutter/material.dart';
import 'package:live_cricket_score/models/ScorBoardModel.dart';
import 'package:velocity_x/velocity_x.dart';

class TableBowerRow {
  final bowler;

  TableBowerRow(this.bowler);

  @override
  TableRow build(BuildContext context) {
    return TableRow(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${bowler.name}",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 12),
              ).pOnly(left: 12, right: 8),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical:8.0),
          child: Text(
            "${bowler.overs}",
            textAlign: TextAlign.end,
            style: TextStyle(color: Colors.grey.shade800, fontSize: 14),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical:8.0),
          child: Text(
            "${cheaknull(bowler.maidens)}",
            textAlign: TextAlign.end,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical:8.0),
          child: Text(
            "${cheaknull(bowler.runs)}",
            textAlign: TextAlign.end,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical:8.0),
          child: Text(
            "${cheaknull(bowler.wickets)}",
            textAlign: TextAlign.end,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0,bottom: 8.0,right: 8.0),
          child: Text(
            "${bowler.economy}",
            textAlign: TextAlign.end,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
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

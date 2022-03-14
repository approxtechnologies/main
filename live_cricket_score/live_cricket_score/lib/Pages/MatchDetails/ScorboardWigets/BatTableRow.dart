import 'package:flutter/material.dart';
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:velocity_x/velocity_x.dart';

class TableOwnRow {
  final batsman;

  const TableOwnRow({Key? key, this.batsman});

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
                "${batsman.name}",
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 12),
              ).pOnly(left: 12, right: 8),
              if (batsman.outDec != null)
                Text(
                  "${batsman.outDec}",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 10),
                ).pOnly(left: 12, right: 8)
              else
                Text(
                  "Did not bat",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 10),
                ).pOnly(left: 12, right: 8),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "${Utils.cheaknull(batsman.runs)}",
            textAlign: TextAlign.end,
            style: TextStyle(color: Colors.grey.shade800, fontSize: 14),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "${Utils.cheaknull(batsman.balls)}",
            textAlign: TextAlign.end,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "${Utils.cheaknull(batsman.fours)}",
            textAlign: TextAlign.end,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "${Utils.cheaknull(batsman.sixes)}",
            textAlign: TextAlign.end,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
          child: Text(
            "${batsman.strkRate}",
            textAlign: TextAlign.end,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
          ),
        ),
      ],
    );
  }
}

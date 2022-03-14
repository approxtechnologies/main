import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live_cricket_score/Pages/MatchDetails/MatchDetail_Page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';

import '../../models/DataModel.dart';

class List_Item extends StatelessWidget {
  final Matches items;

  const List_Item({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MatchDetail_Page(
                items: items,
              ),
            )),
        child: Wrap(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  "${items.matchInfo?.team1?.teamName} VS ${items.matchInfo?.team2?.teamName}"
                      .text
                      .bold
                      .xl
                      .black
                      .make(),
                  "${items.matchInfo?.matchFormat}".text.bold.make(),
                  "${items.matchInfo?.state}".text.bold.make(),
                  "Time :${DateFormat('yyyy-MM-dd').format(DateTime.fromMillisecondsSinceEpoch(int.parse(items.matchInfo!.startDate!)))} to ${DateFormat('yyyy-MM-dd').format(DateTime.fromMillisecondsSinceEpoch(int.parse(items.matchInfo!.endDate!)))}"
                      .text
                      .bold
                      .make(),
                  if (items.matchInfo!.status != null)
                    "${items.matchInfo!.status}".text.make(),
                  if (items.matchScore?.team1Score != null &&
                      items.matchScore!.team1Score!.inngs1 != null)
                    "${items.matchInfo?.team1!.teamSName} : ${items.matchScore!.team1Score!.inngs1!.runs}/${items.matchScore!.team1Score!.inngs1!.wickets}"
                        .text
                        .bold
                        .xl
                        .make(),
                  if (items.matchScore?.team2Score != null &&
                      items.matchScore!.team2Score!.inngs1 != null)
                    "${items.matchInfo?.team2!.teamSName} : ${items.matchScore!.team2Score!.inngs1!.runs} / ${items.matchScore!.team2Score!.inngs1!.wickets}"
                        .text
                        .bold
                        .xl
                        .make(),
                ],
              ).p8(),
            ),
          ],
        ),
      ),
    );
  }
}

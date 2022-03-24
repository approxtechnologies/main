import 'package:flutter/material.dart';
import 'package:live_cricket_score/Pages/MatchDetails/HighLights/HighLights_Tab.dart';
import 'package:live_cricket_score/Pages/MatchDetails/LiveTab.dart';
import 'package:live_cricket_score/Pages/MatchDetails/MatchInfoTab/Match_Info_Tab.dart';
import 'package:live_cricket_score/Pages/MatchDetails/Overs_Pages/Overs_Tab.dart';
import 'package:live_cricket_score/Pages/MatchDetails/ScorboardWigets/ScoreBoard.dart';
import 'package:live_cricket_score/models/ScorBoardModel.dart';
import 'package:live_cricket_score/utils/Utils.dart';

import '../../models/DataModel.dart';

class MatchDetail_Page extends StatelessWidget {
  final Matches items;
  static var data;

  const MatchDetail_Page({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var queryParameters = {
      'id': '${items.matchInfo?.team1?.imageId}',
    };
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: DefaultTabController(
            length: 5,
            child: Scaffold(
                body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    elevation: 5.0,
                    forceElevated: true,
                    title: Text(
                      "${items.matchInfo!.team1!.teamSName} VS ${items.matchInfo!.team2!.teamSName}",
                      style: TextStyle(fontSize: 18),
                    ),
                    titleSpacing: 0,
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios_new),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    pinned: true,
                    floating: true,
                    bottom: TabBar(
                      indicatorWeight: 5.0,
                      isScrollable: true,
                      tabs: [
                        Tab(child: Text('INFO', style: Utils.textStyle)),
                        Tab(child: Text('LIVE', style: Utils.textStyle)),
                        Tab(child: Text('SCORECARD', style: Utils.textStyle)),
                        Tab(child: Text('OVERS', style: Utils.textStyle)),
                        Tab(child: Text('HIGHLIGHTS', style: Utils.textStyle)),
                      ],
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: <Widget>[
                  Match_Info_Tab(items: items),
                  Live_Tab(items: items),
                  Score_Board_Tab(items: items),
                  Overs_Tab(items: items),
                  HighLights_Tab(items: items),
                ],
              ),
            )),
          ),
        ),
      ),
      onWillPop: () {
        MatchDetail_Page.data = ScoreBoardModel();
        Navigator.pop(context, false);
        return Future.value(false);
      },
    );
  }
}

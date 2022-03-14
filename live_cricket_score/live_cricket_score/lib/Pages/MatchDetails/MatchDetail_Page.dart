import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live_cricket_score/Pages/MatchDetails/Match_Info_Tab.dart';
import 'package:live_cricket_score/Pages/MatchDetails/Overs_Pages/Overs_Tab.dart';
import 'package:live_cricket_score/Pages/MatchDetails/ScorboardWigets/ScoreBoard.dart';
import 'package:live_cricket_score/models/ScorBoardModel.dart';
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/DataModel.dart';

class MatchDetail_Page extends StatelessWidget {
  final Matches items;

  const MatchDetail_Page({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var queryParameters = {
      'id': '${items.matchInfo?.team1?.imageId}',
    };
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 5,
          child: Scaffold(
              body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                new SliverAppBar(
                  title: Text('Cricket Live Score'),
                  titleSpacing: 0,
                  leading: Icon(Icons.menu),
                  pinned: true,
                  floating: true,
                  bottom: TabBar(
                    isScrollable: true,
                    tabs: [
                      Tab(child: Text('INFO')),
                      Tab(child: Text('LIVE')),
                      Tab(child: Text('SCORECARD')),
                      Tab(child: Text('OVERS')),
                      Tab(child: Text('HIGHLIGHTS')),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: <Widget>[
                Match_Info_Tab(items: items),
                Match_Info_Tab(items: items),
                Score_Board_Tab(items: items),
                Overs_Tab(items: items),
                Match_Info_Tab(items: items),
              ],
            ),
          )),
        ),
      ),
    );
  }
}

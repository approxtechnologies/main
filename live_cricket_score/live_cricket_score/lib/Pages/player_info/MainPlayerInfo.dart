import 'package:flutter/material.dart';

import 'package:live_cricket_score/Pages/MatchDetails/MatchInfoTab/Team1Tab.dart';
import 'package:live_cricket_score/Pages/MatchDetails/MatchInfoTab/Team2Tab.dart';
import 'package:live_cricket_score/Pages/player_info/PLayerBowlingInfoTab.dart';
import 'package:live_cricket_score/Pages/player_info/PlayerBattingInfoTab.dart';
import 'package:live_cricket_score/Pages/player_info/PlayerCarrerInfo.dart';
import 'package:live_cricket_score/Pages/player_info/PlayerNewsTab.dart';
import 'package:live_cricket_score/Pages/player_info/Player_Info_Tab.dart';
import 'package:live_cricket_score/models/DataModel.dart';
import 'package:live_cricket_score/models/TeamPlayerListModel.dart';
import 'package:live_cricket_score/utils/Utils.dart';

class MainPlayerInfo extends StatelessWidget {
  final Player played;
  const MainPlayerInfo({
    Key? key,
    required this.played,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: DefaultTabController(
          length: 5,
          child: Scaffold(
              body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                new SliverAppBar(
                  title: Text(played.name!),
                  titleSpacing: 0,
                  leading: new IconButton(
                    icon: new Icon(Icons.arrow_back_ios_new),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  pinned: true,
                  floating: true,
                  bottom: TabBar(
                    isScrollable: true,
                    tabs: [
                      Tab(
                          child: Text("Info".toUpperCase(),
                              style: Utils.textStyle)),
                      Tab(
                          child: Text("Batting".toUpperCase(),
                              style: Utils.textStyle)),
                      Tab(
                          child: Text("Bowling".toUpperCase(),
                              style: Utils.textStyle)),
                      Tab(
                          child: Text("Carrer".toUpperCase(),
                              style: Utils.textStyle)),
                      Tab(
                          child: Text("News".toUpperCase(),
                              style: Utils.textStyle)),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: <Widget>[
                Player_Info_Tab(id: played.id!),
                PLayerBattingInfoTab(id: played.id!),
                PLayerBowlingInfoTab(id: played.id!),
                PlayerCarrerInfo(id: played.id!),
                PlayerNewsTab(id: played.id!),
              ],
            ),
          )),
        ),
      ),
    );
    ;
  }
}

import 'package:flutter/material.dart';

import 'package:live_cricket_score/Pages/MatchDetails/MatchInfoTab/Team1Tab.dart';
import 'package:live_cricket_score/Pages/MatchDetails/MatchInfoTab/Team2Tab.dart';
import 'package:live_cricket_score/models/DataModel.dart';

class MainTeamPage extends StatelessWidget {
  final Matches items;
  final int ii;

  const MainTeamPage({
    Key? key,
    required this.items,
    required this.ii,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          initialIndex: ii,
          child: Scaffold(
              body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                new SliverAppBar(
                  title: Text('Squads'),
                  titleSpacing: 0,
                  leading: new IconButton(
                    icon: new Icon(Icons.arrow_back_ios_new),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  pinned: true,
                  floating: true,
                  bottom: TabBar(
                    tabs: [
                      Tab(
                          child: Text(
                              items.matchInfo!.team1!.teamName!.toUpperCase())),
                      Tab(
                          child: Text(
                              items.matchInfo!.team2!.teamName!.toUpperCase())),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: <Widget>[
                Team1Tab(id: items.matchInfo!.team1!.teamId!),
                Team2Tab(id: items.matchInfo!.team2!.teamId!),
              ],
            ),
          )),
        ),
      ),
    );
    ;
  }
}
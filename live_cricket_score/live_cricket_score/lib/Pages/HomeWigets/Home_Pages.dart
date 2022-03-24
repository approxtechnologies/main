import 'package:flutter/material.dart';
import 'package:live_cricket_score/MainWidgets/Drawer.dart';
import 'package:live_cricket_score/Pages/HomeWigets/Home_Tab.dart';
import 'package:live_cricket_score/Pages/HomeWigets/Live_Tab.dart';
import 'package:live_cricket_score/Pages/HomeWigets/UpComping_Tab.dart';

class Home_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
              drawer: MyDrawer(),
              body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    new SliverAppBar(
                      elevation: 5.0,
                      forceElevated: true,
                      title: Text('Cricket Live Score'),
                      titleSpacing: 0,
                      leading: IconButton(
                          onPressed: () => Scaffold.of(context).openDrawer(),
                          icon: Icon(Icons.menu)), //Icon(Icons.menu),
                      pinned: true,
                      floating: true,
                      bottom: TabBar(
                        indicatorWeight: 5.0,
                        tabs: [
                          Tab(child: Text('LIVE')),
                          Tab(child: Text('RECENT')),
                          Tab(child: Text('UPCOMING')),
                        ],
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  children: <Widget>[
                    //Live_Tab(),
                    Live_Tab(),
                    Home_Tab(),
                    UpComing_Tab(),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:live_cricket_score/Pages/MatchDetails/MatchInfoTab/Team1Tab.dart';
import 'package:live_cricket_score/Pages/MatchDetails/MatchInfoTab/Team2Tab.dart';
import 'package:live_cricket_score/Pages/player_info/PLayerBowlingInfoTab.dart';
import 'package:live_cricket_score/Pages/player_info/PlayerBattingInfoTab.dart';
import 'package:live_cricket_score/Pages/player_info/PlayerCarrerInfo.dart';
import 'package:live_cricket_score/Pages/player_info/PlayerNewsTab.dart';
import 'package:live_cricket_score/Pages/player_info/Player_Info_Tab.dart';
import 'package:live_cricket_score/SplashScreen.dart';
import 'package:live_cricket_score/models/DataModel.dart';
import 'package:live_cricket_score/models/TeamPlayerListModel.dart';
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:velocity_x/velocity_x.dart';

class MainPlayerInfo extends StatefulWidget {
  final Player played;
  const MainPlayerInfo({
    Key? key,
    required this.played,
  }) : super(key: key);

  @override
  State<MainPlayerInfo> createState() => _MainPlayerInfoState();
}

class _MainPlayerInfoState extends State<MainPlayerInfo> {
  bool _isBannerAdReady = false;

  late BannerAd banner;

  @override
  void initState() {
    banner = BannerAd(
      adUnitId: SplashScreen.BANNERID,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );
    banner.dispose();
    banner.load();
    if (SplashScreen.full != null &&
        SplashScreen.full.length > 1 &&
        SplashScreen.full[1].ad != null) {
      SplashScreen.full[1].ad.show();
    }
    super.initState();
  }

  @override
  void dispose() {
    banner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: DefaultTabController(
          length: 5,
          child: Scaffold(
              body: Column(
            children: [
              NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    new SliverAppBar(
                      title: Text(widget.played.name!),
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
                    Player_Info_Tab(id: widget.played.id!),
                    PLayerBattingInfoTab(id: widget.played.id!),
                    PLayerBowlingInfoTab(id: widget.played.id!),
                    PlayerCarrerInfo(id: widget.played.id!),
                    PlayerNewsTab(id: widget.played.id!),
                  ],
                ),
              ).expand(),
              Container(
                  height: 50,
                  alignment: Alignment.bottomCenter,
                  child: _isBannerAdReady
                      ? AdWidget(
                          ad: banner,
                        )
                      : Container())
            ],
          )),
        ),
      ),
    );
    ;
  }
}

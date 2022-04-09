import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:live_cricket_score/Pages/MatchDetails/MatchInfoTab/Team1Tab.dart';
import 'package:live_cricket_score/Pages/MatchDetails/MatchInfoTab/Team2Tab.dart';
import 'package:live_cricket_score/SplashScreen.dart';
import 'package:live_cricket_score/models/DataModel.dart';
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:velocity_x/velocity_x.dart';

class MainTeamPage extends StatefulWidget {
  final Matches items;
  final int ii;

  const MainTeamPage({
    Key? key,
    required this.items,
    required this.ii,
  }) : super(key: key);

  @override
  State<MainTeamPage> createState() => _MainTeamPageState();
}

class _MainTeamPageState extends State<MainTeamPage> {
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
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          initialIndex: widget.ii,
          child: Scaffold(
              body: Column(
            children: [
              NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    new SliverAppBar(
                      elevation: 5.0,
                      forceElevated: true,
                      title: Text('Squads'),
                      titleSpacing: 0,
                      leading: new IconButton(
                        icon: new Icon(Icons.arrow_back_ios_new),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      pinned: true,
                      floating: true,
                      bottom: TabBar(
                        indicatorWeight: 5.0,
                        tabs: [
                          Tab(
                              child: Text(
                            widget.items.matchInfo!.team1!.teamName!
                                .toUpperCase(),
                            style: Utils.textStyle,
                          )),
                          Tab(
                              child: Text(
                            widget.items.matchInfo!.team2!.teamName!
                                .toUpperCase(),
                            style: Utils.textStyle,
                          )),
                        ],
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  children: <Widget>[
                    Team1Tab(id: widget.items.matchInfo!.team1!.teamId!),
                    Team2Tab(id: widget.items.matchInfo!.team2!.teamId!),
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
  }
}

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:live_cricket_score/Pages/MatchDetails/HighLights/HighLights_Tab.dart';
import 'package:live_cricket_score/Pages/MatchDetails/LiveTab.dart';
import 'package:live_cricket_score/Pages/MatchDetails/MatchInfoTab/Match_Info_Tab.dart';
import 'package:live_cricket_score/Pages/MatchDetails/Overs_Pages/Overs_Tab.dart';
import 'package:live_cricket_score/Pages/MatchDetails/ScorboardWigets/ScoreBoard.dart';
import 'package:live_cricket_score/SplashScreen.dart';
import 'package:live_cricket_score/models/ScorBoardModel.dart';
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/DataModel.dart';

class MatchDetail_Page extends StatefulWidget {
  final Matches items;
  static var data;

  const MatchDetail_Page({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<MatchDetail_Page> createState() => _MatchDetail_PageState();
}

class _MatchDetail_PageState extends State<MatchDetail_Page> {
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
        SplashScreen.full.length > 0 &&
        SplashScreen.full[0].ad != null) {
      SplashScreen.full[0].ad.show();
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
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: DefaultTabController(
            length: 5,
            child: Scaffold(
                body: Container(
              height: 100.h,
              width: 100.w,
              child: Column(
                children: [
                  Expanded(
                    child: NestedScrollView(
                      headerSliverBuilder:
                          (BuildContext context, bool innerBoxIsScrolled) {
                        return <Widget>[
                          SliverAppBar(
                            elevation: 5.0,
                            forceElevated: true,
                            title: Text(
                              "${widget.items.matchInfo!.team1!.teamSName} VS ${widget.items.matchInfo!.team2!.teamSName}",
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
                                Tab(
                                    child: Text('SCORECARD',
                                        style: Utils.textStyle)),
                                Tab(child: Text('OVERS', style: Utils.textStyle)),
                                Tab(
                                    child: Text('HIGHLIGHTS',
                                        style: Utils.textStyle)),
                              ],
                            ),
                          ),
                        ];
                      },
                      body: TabBarView(
                        children: <Widget>[
                          Match_Info_Tab(items: widget.items),
                          Live_Tab(items: widget.items),
                          Score_Board_Tab(items: widget.items),
                          Overs_Tab(items: widget.items),
                          HighLights_Tab(items: widget.items),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      height: 50,
                      alignment: Alignment.bottomCenter,
                      child: _isBannerAdReady
                          ? AdWidget(
                              ad: banner,
                            )
                          : Container())
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

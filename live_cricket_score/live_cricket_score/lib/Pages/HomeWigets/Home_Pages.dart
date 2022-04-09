import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:live_cricket_score/MainWidgets/Drawer.dart';
import 'package:live_cricket_score/Pages/HomeWigets/Home_Tab.dart';
import 'package:live_cricket_score/Pages/HomeWigets/Live_Tab.dart';
import 'package:live_cricket_score/Pages/HomeWigets/UpComping_Tab.dart';
import 'package:live_cricket_score/SplashScreen.dart';
import 'package:live_cricket_score/adwidgets/native_inline_page.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../MainWidgets/exit.dart';

class Home_Page extends StatefulWidget {
  static int nativeAd = 0;

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  bool _isBannerAdReady = false;

  late BannerAd banner;

  @override
  void initState() {
    if (SplashScreen.APPOPENID != null &&
        SplashScreen.APPOPENID != "" &&
        SplashScreen.appOpenAd != null &&
        !SplashScreen.isShowingAd) SplashScreen.appOpenAd.show();
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
    return WillPopScope(
      onWillPop: () async => bottomSheet(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              drawer: MyDrawer(),
              body: Container(
                height: 100.h,
                width: 100.w,
                child: Column(
                  children: [
                    Container(
                      height: 87.h,
                      child: NestedScrollView(
                          headerSliverBuilder:
                              (BuildContext context, bool innerBoxIsScrolled) {
                            return <Widget>[
                              SliverAppBar(
                                elevation: 5.0,
                                forceElevated: true,
                                title: Text('Cricket Live Score'),
                                titleSpacing: 0,
                                leading: IconButton(
                                    onPressed: () =>
                                        Scaffold.of(context).openDrawer(),
                                    icon: Icon(Icons.menu)),
                                //Icon(Icons.menu),
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
                          body: Container(
                            width: 100.w,
                            child: TabBarView(
                              children: <Widget>[
                                //Live_Tab(),
                                Live_Tab(),
                                Home_Tab(),
                                UpComing_Tab(),
                              ],
                            ),
                          )),
                    ),
                    Column().expand(),
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
              ),
            ),
          ),
        ),
      ),
    );
  }

  bottomSheet() async {
    return showModalBottomSheet(
      enableDrag: false,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      context: context,
      builder: (context) {
        return WillPopScope(onWillPop: () async => true, child: ExitDialog());
      },
    );
  }
}

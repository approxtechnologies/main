import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:live_cricket_score/SplashScreen.dart';
import 'package:live_cricket_score/utils/Utils.dart';
import 'package:sizer/sizer.dart';

class NativeInlinePage extends StatefulWidget {
  @override
  State<NativeInlinePage> createState() => _NativeInlinePageState();
}

class _NativeInlinePageState extends State<NativeInlinePage> {
  // TODO: Add a NativeAd instance
  late NativeAd _ad;

  // TODO: Add _isAdLoaded
  bool _isAdLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _ad = NativeAd(
      adUnitId: SplashScreen.NATIVEID,
      factoryId: 'listTile',
      request: AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isAdLoaded = true;
          });
          print('loaded native ');
        },
        onAdFailedToLoad: (ad, error) {
          // Releases an ad resource when it fails to load
          ad.dispose();

          print('Ad load failed (code=${error.code} message=${error.message})');
        },
      ),
    );

    _ad.load();
  }

  @override
  void dispose() {
    // TODO: Dispose a NativeAd object
    _ad.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isAdLoaded) {
      return Container(
        child: AdWidget(ad: _ad),
        height: 200,
        width: 99.w,
        alignment: Alignment.center,
      );
    } else {
      return Container(
          color: Colors.grey.shade200,
          height: 200,
          alignment: Alignment.center,
          child: Text(
            "AD",
            style: TextStyle(color: Colors.black, fontSize: 10),
          ));
    }
  }
}

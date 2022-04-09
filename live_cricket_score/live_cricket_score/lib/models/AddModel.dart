import 'package:google_mobile_ads/google_mobile_ads.dart';

class Admodel{

  String? adType;
  bool b = false;
  String? id;
  late InterstitialAd _ad;

  InterstitialAd get ad => _ad;

  set ad(InterstitialAd ad) {
    _ad = ad;
  }

  Admodel(this.adType, this.b, this.id);
}
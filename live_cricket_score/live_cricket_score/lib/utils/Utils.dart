import 'package:flutter/material.dart';

class Utils {
  static Map<String, String> HEADERS = {
    "X-RapidAPI-Host": "unofficial-cricbuzz.p.rapidapi.com",
    "X-RapidAPI-Key": "10c251fbddmsh5607b1e802913b1p1a9bcbjsndb27187bb539"
  };
  static String IMAGEAPI = "/get-image";
  static String MATCHLISTENDPOINT = "/matches/list";
  static String MATCHINFO = "/matches/get-info";
  static String MATChSCOREBOARD = "/matches/get-scorecard";
  static String OVERSFETCH = "/matches/get-overs";
  static String HIGHLIGHTS = "/matches/get-highlights";
  static String TEAMPLAYERS = "/teams/get-players";
  static String PLAYERINFO = "/players/get-info";
  static String BATTINGINFO = "/players/get-batting";
  static String BOWLINGINFO = "/players/get-bowling";
  static String CARRERINFO = "/players/get-career";
  static String NEWSINFO = "/players/get-news";
  static TextStyle textStyle = TextStyle(fontWeight: FontWeight.bold);
  static RoundedRectangleBorder radious = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(7)));

  static Uri getUrl(String endpoint, var queryParameters) {
    return Uri.https(
        'unofficial-cricbuzz.p.rapidapi.com', endpoint, queryParameters);
  }

  static int cheaknull(var d) {
    if (d != null) {
      if (d > 0)
        return d;
      else
        return 0;
    } else
      return 0;
  }
}

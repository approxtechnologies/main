class Utils {
  static Map<String, String> HEADERS = {
    "X-RapidAPI-Host": "unofficial-cricbuzz.p.rapidapi.com",
    "X-RapidAPI-Key": "577be2afe3msh7d493e8e4b4f04ap1f92d5jsn75fe281768f3"
  };
  static String IMAGEAPI = "/get-image";
  static String MATCHLISTENDPOINT = "/matches/list";
  static String MATCHINFO = "/matches/get-info";
  static String MATChSCOREBOARD = "/matches/get-scorecard";
  static String OVERSFETCH = "/matches/get-overs";
  static String HIGHLIGHTS = "/matches/get-highlights";
  static String TEAMPLAYERS = "/teams/get-players";

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

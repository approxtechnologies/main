class Utils{

 static String BASE_URL = "https://api.api-cricket.com/cricket/";
 static String API_TOCKEN = "9653f8ec2e159450db5897869f9e23a166c27655c31d8eb034b4ef0e998c0865";
 static Map<String,String> HEADERS = {
      "X-RapidAPI-Host": "unofficial-cricbuzz.p.rapidapi.com",
      "X-RapidAPI-Key": "10c251fbddmsh5607b1e802913b1p1a9bcbjsndb27187bb539 "
    };
 static String IMAGEAPI = "/get-image/";
 static String MATCHLISTENDPOINT = "/matches/list";
static String MATCHINFO = "/matches/get-info";
static String MATChSCOREBOARD = "/matches/get-scorecard";
static String OVERSFETCH = "/matches/get-overs";


  static Uri getUrl(String endpoint , var queryParameters){
    return  Uri.https('unofficial-cricbuzz.p.rapidapi.com',endpoint, queryParameters);
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
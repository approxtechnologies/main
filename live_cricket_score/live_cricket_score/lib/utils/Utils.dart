class Utils{

 static String BASE_URL = "https://api.api-cricket.com/cricket/";
 static String API_TOCKEN = "9653f8ec2e159450db5897869f9e23a166c27655c31d8eb034b4ef0e998c0865";
 static Map<String,String> HEADERS = {
      "X-RapidAPI-Host": "unofficial-cricbuzz.p.rapidapi.com",
      "X-RapidAPI-Key": "8a8417e723msh9ffa4a73ad69988p114086jsn6bf5e44bd08e"
    };
 static String IMAGEAPI = "/get-image/";
 static String MATCHLISTENDPOINT = "/matches/list";


  static Uri getUrl(String endpoint , var queryParameters){
    return  Uri.https('unofficial-cricbuzz.p.rapidapi.com',endpoint, queryParameters);
  }

}
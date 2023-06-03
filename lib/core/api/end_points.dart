class EndPoints{
  static const String baseUrl="https://api.themoviedb.org/3/";
  static const String _apiKey = "6405212758b8be6d7171cf2b7493b3d1";
  static const String basePosterUrl = "https://image.tmdb.org/t/p/w500";
  static const String baseBackDropsUrl = "https://image.tmdb.org/t/p/w780";
  static const String baseLogoUrl = "https://image.tmdb.org/t/p/w185";
  static const String baseHdUrl = "https://image.tmdb.org/t/p/w1280";
  static String requestTokenPath="$baseUrl/authentication/token/new?api_key=$_apiKey";
  static String approveToken(String token)=>
      "https://www.themoviedb.org/authenticate/$token";
  static String sessionIdPath(String token)=>
      "$baseUrl/authentication/session/new?api_key=$_apiKey&request_token=$token";
  static String logOutPath= "$baseUrl/authentication/session?api_key=$_apiKey";
  static String mediaDetailsPath(int mediaId,String sessionId,String mediaType,String lang) =>
      "$baseUrl/$mediaType/$mediaId?api_key=$_apiKey&session_id=$sessionId&append_to_response=keywords,account_states,videos&language=$lang";
  static String trendingMediaPath ({required int page,required String mediaType,required String lang})=>
      "$baseUrl/trending/$mediaType/day?api_key=$_apiKey&page=$page&language=$lang";
  static String mediaListsPath(String mediaType,String listType,int page,String lang) =>
      "$baseUrl/$mediaType/$listType?api_key=$_apiKey&page=$page&language=$lang";
  static String recommendationMediaPath(int mediaId,String mediaType,String lang) =>
      "$baseUrl/$mediaType/$mediaId/recommendations?api_key=$_apiKey&page=1&language=$lang";
  static String similarMediaPath(int mediaId,int page,String mediaType,String lang) =>
      "$baseUrl/$mediaType/$mediaId/similar?api_key=$_apiKey&page=$page&language=$lang";
  static String mediaReviewsPath(int mediaId,String mediaType) =>
      "$baseUrl/$mediaType/$mediaId/reviews?api_key=$_apiKey";
  static String mediaCreditsPath(int mediaId,String mediaType) =>
      "$baseUrl/$mediaType/$mediaId/credits?api_key=$_apiKey";
  static String mediaGalleryPath(int movieId,String mediaType) =>
      "$baseUrl/$mediaType/$movieId/images?api_key=$_apiKey";
  static String markMediaPath(String sessionid,String markType)=>
      "${baseUrl}account/{account_id}/$markType?api_key=$_apiKey&session_id=$sessionid";
  static String rateMediaPath(String sessionid,int mediaId,String mediaType)=>
      "$baseUrl/$mediaType/$mediaId/rating?api_key=$_apiKey&session_id=$sessionid";
  static String tvShowSeasonDetailsPath(int tvId,int seasonNumber,String lang) =>
      "$baseUrl/tv/$tvId/season/$seasonNumber?api_key=$_apiKey&language=$lang";
  static String searchUrl({required String query,required int page,required String lang})=>
      "${baseUrl}search/multi?api_key=$_apiKey&page=$page&query=$query&language=$lang";
  static String backDropsUrl(String path) =>
      "$baseBackDropsUrl$path";
  static String posterUrl(String path) =>
      "$basePosterUrl$path";
  static String logoUrl(String path) =>
      "$baseLogoUrl$path";
  static String hdUrl(String path) =>
      "$baseHdUrl$path";
  static String accountPath(String sessionId) =>
      "$baseUrl/account?api_key=$_apiKey&session_id=$sessionId";
  static String accountMediaListPath(String sessionid,String mediaType,String listType,int page,String lang)=>
     "${baseUrl}account/{account_id}/$listType/$mediaType?api_key=$_apiKey&session_id=$sessionid&page=$page&language=$lang";
  static String createMediaListPath(String sessionid)=>"${baseUrl}list?api_key=$_apiKey&session_id=$sessionid";
  static String getAccountCustomListsPath(String sessionid,String accountId)=> "${baseUrl}account/$accountId?api_key=$_apiKey&session_id=$sessionid";


}
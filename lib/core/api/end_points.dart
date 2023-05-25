class EndPoints{
  static const String baseUrl="https://api.themoviedb.org/3/";
  static const String apiKey = "6405212758b8be6d7171cf2b7493b3d1";
  static const String basePosterUrl = "https://image.tmdb.org/t/p/w500";
  static const String baseBackDropsUrl = "https://image.tmdb.org/t/p/w780";
  static const String baseLogoUrl = "https://image.tmdb.org/t/p/w185";
  static const String baseHdUrl = "https://image.tmdb.org/t/p/w1280";
  static String requestTokenPath="$baseUrl/authentication/token/new?api_key=$apiKey";
  static String approveToken(String token)=>
      "https://www.themoviedb.org/authenticate/$token";
  static String sessionIdPath(String token)=>
      "$baseUrl/authentication/session/new?api_key=$apiKey&request_token=$token";
  static String logOutPath= "$baseUrl/authentication/session?api_key=$apiKey";
  static String mediaDetailsPath(int mediaId,String sessionId,String mediaType) =>
      "$baseUrl/$mediaType/$mediaId?api_key=$apiKey&session_id=$sessionId&append_to_response=keywords,account_states,videos";
  static String nowPlayingMediaPath({required int page,required String mediaType,required nowPlaying}) =>
      "$baseUrl/$mediaType/$nowPlaying?api_key=$apiKey&page=$page";
  static String trendingMediaPath ({required int page,required String mediaType})=>
      "$baseUrl/trending/$mediaType/day?api_key=$apiKey&page=$page";
  static String popularMediaPath ({required int page,required String mediaType})=>
      "$baseUrl/$mediaType/popular?api_key=$apiKey&page=$page";
  static  String topRatedMediaPath({required int page,required String mediaType}) =>
      "$baseUrl/$mediaType/top_rated?api_key=$apiKey&page=$page";
  static String recommendationMediaPath(int mediaId,String mediaType) =>
      "$baseUrl/$mediaType/$mediaId/recommendations?api_key=$apiKey&page=1";
  static String similarMediaPath(int mediaId,int page,String mediaType) =>
      "$baseUrl/$mediaType/$mediaId/similar?api_key=$apiKey&page=$page";
  static String mediaReviewsPath(int mediaId,String mediaType) =>
      "$baseUrl/$mediaType/$mediaId/reviews?api_key=$apiKey";
  static String mediaCreditsPath(int mediaId,String mediaType) =>
      "$baseUrl/$mediaType/$mediaId/credits?api_key=$apiKey";
  static String mediaGalleryPath(int movieId,String mediaType) =>
      "$baseUrl/$mediaType/$movieId/images?api_key=$apiKey";
  static String markMediaPath(String sessionid,String markType)=>
      "${baseUrl}account/{account_id}/$markType?api_key=$apiKey&session_id=$sessionid";
  static String rateMediaPath(String sessionid,int mediaId,String mediaType)=>
      "$baseUrl/$mediaType/$mediaId/rating?api_key=$apiKey&session_id=$sessionid";
  static String tvShowSeasonDetailsPath(int tvId,int seasonNumber) =>
      "$baseUrl/tv/$tvId/season/$seasonNumber?api_key=$apiKey";
  static String searchUrl({required String query,required int page})=>
      "${baseUrl}search/multi?api_key=$apiKey&page=$page&query=$query";
  static  String backDropsUrl(String path) =>
      "$baseBackDropsUrl$path";
  static  String posterUrl(String path) =>
      "$basePosterUrl$path";
  static  String logoUrl(String path) =>
      "$baseLogoUrl$path";
  static  String hdUrl(String path) =>
      "$baseHdUrl$path";
  static String accountPath(String sessionId) =>
      "$baseUrl/account?api_key=$apiKey&session_id=$sessionId";
  static String accountMediaListPath(String sessionid,String mediaType,String listType,page)=>
     "${baseUrl}account/{account_id}/$listType/$mediaType?api_key=$apiKey&session_id=$sessionid&page=$page";
}
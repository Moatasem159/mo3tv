class EndPoints{

  static const String baseUrl="https://api.themoviedb.org/3/";
  static const String apiKey = "6405212758b8be6d7171cf2b7493b3d1";
  static const String basePosterUrl = "https://image.tmdb.org/t/p/w500";
  static const String baseBackDropsUrl = "https://image.tmdb.org/t/p/w780";
  static const String baseLogoUrl = "https://image.tmdb.org/t/p/w185";



  static String mediaDetailsPath(int mediaId,String sessionId,String mediaType) =>
      "$baseUrl/$mediaType/$mediaId?api_key=$apiKey&session_id=$sessionId&append_to_response=keywords,account_states";
  static String nowPlayingMediaPath({required int page,required String mediaType,required nowPlaying}) =>
      "$baseUrl/$mediaType/$nowPlaying?api_key=$apiKey&page=$page";
  static String popularMediaPath ({required int page,required String mediaType})=>
      "$baseUrl/$mediaType/popular?api_key=$apiKey&page=$page";
  static  String topRatedMediaPath({required int page,required String mediaType}) =>
      "$baseUrl/$mediaType/top_rated?api_key=$apiKey&page=$page";
  static String recommendationMediaPath(int mediaId,int page,String mediaType) =>
      "$baseUrl/$mediaType/$mediaId/recommendations?api_key=$apiKey&page=$page";
  static String mediaReviewsPath(int mediaId,String mediaType) =>
      "$baseUrl/$mediaType/$mediaId/reviews?api_key=$apiKey";



  static String mediaCreditsPath(int mediaId,String mediaType) =>
      "$baseUrl/$mediaType/$mediaId/credits?api_key=$apiKey";
  static String movieVideos(int movieId) =>
      "$baseUrl/movie/$movieId/videos?api_key=$apiKey";
  static String movieGalleryPath(int movieId) =>
      "$baseUrl/movie/$movieId/images?api_key=$apiKey";

  static  String backDropsUrl(String path) => "$baseBackDropsUrl$path";
  static  String posterUrl(String path) => "$basePosterUrl$path";
  static  String logoUrl(String path) => "$baseLogoUrl$path";


 static String requestTokenPath="$baseUrl/authentication/token/new?api_key=$apiKey";
 static String approveToken(String token)=>"https://www.themoviedb.org/authenticate/$token";
 static String sessionIdPath(String token)=>"$baseUrl/authentication/session/new?api_key=$apiKey&request_token=$token";

 static String rateMoviePath(String sessionid,int movieId)=>"$baseUrl/movie/$movieId/rating?api_key=$apiKey&session_id=$sessionid";
 static String ratedMoviesListPath(String sessionid)=>"${baseUrl}account/{account_id}/rated/movies?api_key=$apiKey&session_id=$sessionid";
 static String favMoviePath(String sessionid)=>"${baseUrl}account/{account_id}/favorite?api_key=$apiKey&session_id=$sessionid";
 static String favMoviesListPath(String sessionid)=>"${baseUrl}account/{account_id}/favorite/movies?api_key=$apiKey&session_id=$sessionid";
 static String addToWatchListPath(String sessionid)=>"${baseUrl}account/{account_id}/watchlist?api_key=$apiKey&session_id=$sessionid";
 static String moviesWatchListPath(String sessionid)=>"${baseUrl}account/{account_id}/watchlist/movies?api_key=$apiKey&session_id=$sessionid";


}
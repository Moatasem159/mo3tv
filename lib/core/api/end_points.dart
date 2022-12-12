class EndPoints{

  static const String baseUrl="https://api.themoviedb.org/3/";
  static const String apiKey = "6405212758b8be6d7171cf2b7493b3d1";
  static const String basePosterUrl = "https://image.tmdb.org/t/p/w500";
  static const String baseBackDropsUrl = "https://image.tmdb.org/t/p/w780";
  static const String baseLogoUrl = "https://image.tmdb.org/t/p/w185";
  static String nowPlayingMoviesPath({required int page}) =>
      "$baseUrl/movie/now_playing?api_key=$apiKey&page=$page";
  static String nowPopularMoviesPath ({required int page})=>
      "$baseUrl/movie/popular?api_key=$apiKey&page=$page";
  static  String nowTopRatedMoviesPath({required int page}) =>
      "$baseUrl/movie/top_rated?api_key=$apiKey&page=$page";

  static String movieDetailsPath(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";

  static String recommendationPath(int movieId,int page) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey&page=$page";

  static String movieKeywordsPath(int movieId) =>
      "$baseUrl/movie/$movieId/keywords?api_key=$apiKey";
  static String movieReviewsPath(int movieId) =>
      "$baseUrl/movie/$movieId/reviews?api_key=$apiKey";
  static String movieCreditsPath(int movieId) =>
      "$baseUrl/movie/$movieId/credits?api_key=$apiKey";
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
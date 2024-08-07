import 'package:mo3tv/core/api/env.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
abstract class EndPoints{
  static const String baseUrl="https://api.themoviedb.org/3";
  static const String basePosterUrl = "https://image.tmdb.org/t/p/w500";
  static const String baseBackDropsUrl = "https://image.tmdb.org/t/p/w780";
  static const String baseLogoUrl = "https://image.tmdb.org/t/p/w185";
  static const String baseHdUrl = "https://image.tmdb.org/t/p/w1280";
  static String requestTokenPath="$baseUrl/authentication/token/new?api_key=${Env.apiKey}";
  static String approveToken(String token)=>
      "https://www.themoviedb.org/authenticate/$token";
  static String sessionIdPath(String token)=>
      "$baseUrl/authentication/session/new?api_key=${Env.apiKey}&request_token=$token";
  static String logOutPath= "$baseUrl/authentication/session?api_key=${Env.apiKey}";
  static String mediaDetailsPath(String sessionId, MediaParams params) =>
      "$baseUrl/${params.mediaType}/${params.mediaId}?api_key=${Env.apiKey}&session_id=$sessionId&append_to_response=keywords,account_states,videos&language=${params.lang}";
  static String discoverPath(MediaParams params) =>
      "$baseUrl/discover/${params.mediaType}?api_key=${Env.apiKey}&language=${params.lang}&with_genres=${params.genres}&page=${params.page}";
  static String trendingMediaPath (MediaParams params)=>
      "$baseUrl/trending/${params.mediaType}/day?api_key=${Env.apiKey}&page=${params.page}&language=${params.lang}";
  static String mediaListsPath(MediaParams params) =>
      "$baseUrl/${params.mediaType}/${params.listType}?api_key=${Env.apiKey}&page=${params.page}&language=${params.lang}";
  static String similarMediaPath(MediaParams params) =>
      "$baseUrl/${params.mediaType}/${params.mediaId}/${params.moreType}?api_key=${Env.apiKey}&page=${params.page}&language=${params.lang}";
  static String mediaReviewsPath(MediaParams params) =>
      "$baseUrl/${params.mediaType}/${params.mediaId}/reviews?api_key=${Env.apiKey}";
  static String mediaCreditsPath(MediaParams params) =>
      "$baseUrl/${params.mediaType}/${params.mediaId}/credits?api_key=${Env.apiKey}";
  static String mediaGalleryPath(MediaParams params) =>
      "$baseUrl/${params.mediaType}/${params.mediaId}/images?api_key=${Env.apiKey}";
  static String markMediaPath(String sessionid,String markType)=>
      "$baseUrl/account/{account_id}/$markType?api_key=${Env.apiKey}&session_id=$sessionid";
  static String rateMediaPath(String sessionid,MediaParams params)=>
      "$baseUrl/${params.mediaType}/${params.mediaId}/rating?api_key=${Env.apiKey}&session_id=$sessionid";
  static String tvShowSeasonDetailsPath(MediaParams params) =>
      "$baseUrl/tv/${params.mediaId}/season/${params.seasonNumber}?api_key=${Env.apiKey}&language=${params.lang}";
  static String searchUrl({required String query,required int page,required String lang})=>
      "$baseUrl/search/multi?api_key=${Env.apiKey}&page=$page&query=$query&language=$lang";
  static String backDropsUrl(String path) =>
      "$baseBackDropsUrl$path";
  static String posterUrl(String path) =>
      "$basePosterUrl$path";
  static String logoUrl(String path) =>
      "$baseLogoUrl$path";
  static String hdUrl(String path) =>
      "$baseHdUrl$path";
  static String accountPath(String sessionId) => "$baseUrl/account?api_key=${Env.apiKey}&session_id=$sessionId";
  static String accountMediaListPath(String sessionid,MediaParams params)=>
     "$baseUrl/account/{account_id}/${params.listType}/${params.mediaType}?api_key=${Env.apiKey}&session_id=$sessionid&page=${params.page}&language=${params.lang}";
}
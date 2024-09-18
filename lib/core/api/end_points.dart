import 'package:mo3tv/features/media/domain/entities/media_params.dart';

abstract class EndPoints {
  static String approveToken(String token) =>
      "https://www.themoviedb.org/authenticate/$token";
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String basePosterUrl = "https://image.tmdb.org/t/p/w500";
  static const String baseBackDropsUrl = "https://image.tmdb.org/t/p/w780";
  static const String baseLogoUrl = "https://image.tmdb.org/t/p/w185";
  static const String baseHdUrl = "https://image.tmdb.org/t/p/w1280";
  static String requestTokenPath = "/authentication/token/new";

  static String sessionIdPath(String token) =>
      "/authentication/session/new?request_token=$token";
  static String logOutPath = "/authentication/session";

  static String mediaDetailsPath(String sessionId, MediaParams params) =>
      "/${params.mediaType}/${params.mediaId}?session_id=$sessionId&append_to_response=keywords,account_states,videos&language=${params.lang}";

  static String discoverPath(MediaParams params) =>
      "/discover/${params.mediaType}?language=${params.lang}&with_genres=${params.genres}&page=${params.page}";

  static String trendingMediaPath(MediaParams params) =>
      "/trending/${params.mediaType}/day?page=${params.page}&language=${params.lang}";

  static String mediaListsPath(MediaParams params) =>
      "/${params.mediaType}/${params.listType}?page=${params.page}&language=${params.lang}";

  static String similarMediaPath(MediaParams params) =>
      "/${params.mediaType}/${params.mediaId}/${params.moreType}?page=${params.page}&language=${params.lang}";

  static String mediaReviewsPath(MediaParams params) =>
      "/${params.mediaType}/${params.mediaId}/reviews";

  static String mediaCreditsPath(MediaParams params) =>
      "/${params.mediaType}/${params.mediaId}/credits";

  static String mediaGalleryPath(MediaParams params) =>
      "/${params.mediaType}/${params.mediaId}/images";

  static String markMediaPath(String sessionid, String markType) =>
      "/account/{account_id}/$markType?session_id=$sessionid";

  static String rateMediaPath(String sessionid, MediaParams params) =>
      "/${params.mediaType}/${params.mediaId}/rating?session_id=$sessionid";

  static String tvShowSeasonDetailsPath(MediaParams params) =>
      "/tv/${params.mediaId}/season/${params.seasonNumber}?language=${params.lang}";

  static String searchUrl(
          {required String query, required int page, required String lang}) =>
      "/search/multi?page=$page&query=$query&language=$lang";

  static String backDropsUrl(String path) => "$baseBackDropsUrl$path";

  static String posterUrl(String path) => "$basePosterUrl$path";

  static String logoUrl(String path) => "$baseLogoUrl$path";

  static String hdUrl(String path) => "$baseHdUrl$path";

  static String accountPath(String sessionId) =>
      "/account?session_id=$sessionId";

  static String accountMediaListPath(String sessionid, MediaParams params) =>
      "/account/{account_id}/${params.listType}/${params.mediaType}?session_id=$sessionid&page=${params.page}&language=${params.lang}";
}
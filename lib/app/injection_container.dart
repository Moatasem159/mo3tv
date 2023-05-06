import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/app_interceptors.dart';
import 'package:mo3tv/core/api/dio_consumer.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/core/shared/shared_prefrences.dart';
import 'package:mo3tv/core/shared/shared_prefrences_consumer.dart';
import 'package:mo3tv/features/account/data/datasources/account_datasource.dart';
import 'package:mo3tv/features/account/data/repositories/account_repository_impl.dart';
import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';
import 'package:mo3tv/features/account/domain/usecases/get_account_details_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/get_fav_movies_list_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/get_fav_tv_shows_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/get_movies_watchlist_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/get_rated_movies_list_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/get_rated_tv_shows_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/get_tv_shows_watchlist_usecase.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit.dart';
import 'package:mo3tv/features/login/data/datasources/login_datasource.dart';
import 'package:mo3tv/features/logout/data/datasources/log_out_datasource.dart';
import 'package:mo3tv/features/logout/data/repositories/log_out_repository_impl.dart';
import 'package:mo3tv/features/logout/domain/repositories/log_out_repository.dart';
import 'package:mo3tv/features/logout/domain/usecases/log_out_usecase.dart';
import 'package:mo3tv/features/login/data/repositories/login_repository_impl.dart';
import 'package:mo3tv/features/login/domain/repositories/login_repository.dart';
import 'package:mo3tv/features/login/domain/usecases/get_sessionid_usecase.dart';
import 'package:mo3tv/features/login/domain/usecases/get_token_usecase.dart';
import 'package:mo3tv/features/login/presentation/cubit/login_cubit.dart';
import 'package:mo3tv/features/logout/presentation/cubit/log_out_cubit.dart';
import 'package:mo3tv/features/movies/data/datasource/movie_remote_datasource.dart';
import 'package:mo3tv/features/movies/data/repositories/movies_repository.dart';
import 'package:mo3tv/features/movies/domain/repositories/base_movie_repository.dart';
import 'package:mo3tv/features/movies/domain/usecases/add_movie_to_watchlist_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/delete_rate_movie_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movie_credits_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movie_gallery_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movie_recommendations_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movie_reviews_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_trending_movies_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/mark_movie_as_fav_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/rate_movie_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/more_movies_cubit/more_movies_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/playing_now_movie_cubit/playing_now_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/trending_movie_cubit/trending_movie_cubit.dart';
import 'package:mo3tv/features/search/data/datasources/search_datasource.dart';
import 'package:mo3tv/features/search/data/repositories/search_repository_impl.dart';
import 'package:mo3tv/features/search/domain/repositories/search_repository.dart';
import 'package:mo3tv/features/search/domain/usecases/search_usecase.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_cubit.dart';
import 'package:mo3tv/features/tv/data/datasource/tv_show_remote_datasource.dart';
import 'package:mo3tv/features/tv/data/repositories/tv_repository_impl.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';
import 'package:mo3tv/features/tv/domain/usecases/add_tv_show_to_watchlist_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/delete_tv_show_rate_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_now_playing_tv_shows_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_popular_tv_shows_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_top_rated_tv_shows_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_trending_tv_shows_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_recommendations_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_reviews_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_show_credits_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_show_details_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_show_gallery_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_show_season_details_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/mark_tv_show_as_fav_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/rate_tv_show_usecase.dart';
import 'package:mo3tv/features/tv/presentation/cubit/more_tv_shows_cubit/more_tv_shows_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/playing_now_tv_show_cubit/playing_now_tv_show_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/popular_tv_show_cubit/popular_tv_show_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/top_rated_tv_show_cubit/top_rated_tv_show_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/trending_tv_show_cubit/trending_tv_show_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
final sl = GetIt.instance;
Future<void> init() async {
  ///features
  //blocs

  sl.registerFactory(() =>SearchCubit(searchUsecase:sl()));
  sl.registerFactory<MovieCubit>(() => MovieCubit(
      rateMovieUseCase: sl(),
      getMovieGalleryUsecase: sl(),
      getMovieReviewsUsecase: sl(),
      deleteRateMovieUseCase: sl(),
      markMovieAsFavUsecase: sl(),
      addMovieToWatchListUseCase: sl(),
      getMovieCreditsUsecase: sl(),
      getMovieRecommendationsUseCase: sl(),
      getMovieDetailsUseCase: sl()));
  sl.registerFactory<TvCubit>(() => TvCubit(
    getTvShowDetailsUsecase: sl(),
    getTvShowSeasonDetailsUsecase: sl(),
    getTvRecommendationsUseCase: sl(),
    getTvShowsReviewsUsecase: sl(),
    getTvShowCreditsUsecase: sl(),
    getTvShowGalleryUsecase: sl(),
    markTvShowAsFavUsecase: sl(),
    addTvShowToWatchListUseCase: sl(),
    deleteTvShowRateUseCase: sl(),
    rateTvShowUseCase: sl(),
  ));
  sl.registerFactory<PlayingNowMovieCubit>(()=>PlayingNowMovieCubit(getNowPlayingMoviesUsecase: sl()));
  sl.registerFactory<PlayingNowTvShowCubit>(()=>PlayingNowTvShowCubit(getNowPlayingTvShowsUsecase: sl()));
  sl.registerFactory<TrendingMovieCubit>(()=>TrendingMovieCubit(getTrendingMoviesUsecase:  sl()));
  sl.registerFactory<TrendingTvShowCubit>(()=>TrendingTvShowCubit(getTrendingTvShowsUsecase:sl()));
  sl.registerFactory<PopularMovieCubit>(()=>PopularMovieCubit(popularMoviesUsecase:sl()));
  sl.registerFactory<PopularTvShowCubit>(()=>PopularTvShowCubit(getPopularTvShowsUsecase:sl()));
  sl.registerFactory<TopRatedMoviesCubit>(()=>TopRatedMoviesCubit(getTopRatedMoviesUsecase:sl()));
  sl.registerFactory<TopRatedTvShowsCubit>(()=>TopRatedTvShowsCubit(getTopRatedTvShowUsecase:sl()));
  sl.registerFactory<MoreMoviesCubit>(()=>MoreMoviesCubit(
      getTopRatedMoviesUsecase:sl(), popularMoviesUsecase: sl(), getTrendingMoviesUsecase: sl()));
  sl.registerFactory<MoreTvShowsCubit>(()=>MoreTvShowsCubit(
      getTrendingTvShowsUsecase:sl(), getPopularTvShowsUsecase: sl(), getTopRatedTvShowUsecase: sl()));


  // movie useCases
  sl.registerLazySingleton<GetNowPlayingMoviesUsecase>(
          () => GetNowPlayingMoviesUsecase(baseMovieRepository: sl()));
  sl.registerLazySingleton<GetPopularMoviesUsecase>(
      () => GetPopularMoviesUsecase(sl()));
  sl.registerLazySingleton<GetTrendingMoviesUsecase>(
          () => GetTrendingMoviesUsecase(sl()));
  sl.registerLazySingleton<GetTopRatedMoviesUsecase>(
      () => GetTopRatedMoviesUsecase(sl()));
  sl.registerLazySingleton<GetMovieDetailsUseCase>(
          () => GetMovieDetailsUseCase( baseMovieRepository: sl(),));
  sl.registerLazySingleton<GetMovieRecommendationsUseCase>(
          () => GetMovieRecommendationsUseCase( baseMovieRepository: sl(),));
  sl.registerLazySingleton<GetMovieReviewsUsecase>(
          () => GetMovieReviewsUsecase(sl()));
  sl.registerLazySingleton<GetMovieCreditsUsecase>(
          () => GetMovieCreditsUsecase(sl()));
  sl.registerLazySingleton<GetMovieGalleryUsecase>(
          () => GetMovieGalleryUsecase(sl()));
  sl.registerLazySingleton<RateMovieUseCase>(
          () => RateMovieUseCase(sl()));
  sl.registerLazySingleton<DeleteRateMovieUseCase>(
          () => DeleteRateMovieUseCase(sl()));
  sl.registerLazySingleton<MarkMovieAsFavUsecase>(
          () => MarkMovieAsFavUsecase(sl()));
  sl.registerLazySingleton<AddMovieToWatchListUseCase>(
          () => AddMovieToWatchListUseCase(sl()));

  //// tv Usecases
  sl.registerLazySingleton<GetNowPlayingTvShowsUsecase>(
          () => GetNowPlayingTvShowsUsecase(tvRepository: sl(),));
  sl.registerLazySingleton<GetPopularTvShowsUsecase>(
          () => GetPopularTvShowsUsecase(tvRepository: sl(),));
  sl.registerLazySingleton<GetTrendingTvShowsUsecase>(
          () => GetTrendingTvShowsUsecase(tvRepository: sl(),));
  sl.registerLazySingleton<GetTopRatedTvShowUsecase>(
          () => GetTopRatedTvShowUsecase(tvRepository: sl(),));
  sl.registerLazySingleton<GetTvShowDetailsUsecase>(
          () => GetTvShowDetailsUsecase(tvRepository: sl(),));
  sl.registerLazySingleton<GetTvRecommendationsUseCase>(
          () => GetTvRecommendationsUseCase(tvRepository: sl(),));
  sl.registerLazySingleton<GetTvShowsReviewsUsecase>(
          () => GetTvShowsReviewsUsecase(sl()));
  sl.registerLazySingleton<GetTvShowCreditsUsecase>(
          () => GetTvShowCreditsUsecase(sl()));
  sl.registerLazySingleton<GetTvShowGalleryUsecase>(
          () => GetTvShowGalleryUsecase(sl()));
  sl.registerLazySingleton<MarkTvShowAsFavUsecase>(
          () => MarkTvShowAsFavUsecase(sl()));
  sl.registerLazySingleton<AddTvShowToWatchListUseCase>(
          () => AddTvShowToWatchListUseCase(sl()));
  sl.registerLazySingleton<DeleteTvShowRateUseCase>(
          () => DeleteTvShowRateUseCase(sl()));
  sl.registerLazySingleton<RateTvShowUseCase>(
          () => RateTvShowUseCase(sl()));
  sl.registerLazySingleton<GetTvShowSeasonDetailsUsecase>(
          () => GetTvShowSeasonDetailsUsecase(sl(),));

  ///search

  sl.registerLazySingleton<SearchUsecase>(
          () => SearchUsecase(sl(),));
  ///account usecases


  ///logOut usecase

  // Repository

  sl.registerLazySingleton<MovieRepository>(
      () => MoviesRepositoryImpl(baseMovieRemoteDataSource: sl(),networkInfo: sl()));

  sl.registerLazySingleton<TvRepository>(
          () => TvShowRepositoryImpl(tvShowRemoteDataSource:sl(),networkInfo: sl()));
  sl.registerLazySingleton<SearchRepository>(
          () => SearchRepositoryImpl(networkInfo: sl(), searchDataSource: sl()));


  //dataSource

  sl.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(apiConsumer: sl()));

  sl.registerLazySingleton<TvShowRemoteDataSource>(
          () => TvShowRemoteDataSourceImpl( apiConsumer: sl(),));
  sl.registerLazySingleton<SearchDataSource>(() => SearchDataSourceImpl(apiConsumer:sl(),));


  account();
  logout();
  await external();
}

login(){
  if (!GetIt.I.isRegistered<GetTokenUsecase>())
    {
      sl.registerFactory<LoginCubit>(() =>LoginCubit(sl(),sl(),sl()));
      sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(sl(),sl()),);
      sl.registerLazySingleton<GetTokenUsecase>(() => GetTokenUsecase( sl()));
      sl.registerLazySingleton<GetSessionIdUsecase>(() => GetSessionIdUsecase(sl()));
      sl.registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl(sl()));
    }
}

logout(){
  sl.registerFactory(() =>LogOutCubit(sl(),sl()));
  sl.registerLazySingleton<LogOutUsecase>(()=>LogOutUsecase(sl()));
  sl.registerLazySingleton<LogOutRepository>(() => LogOutRepositoryImpl(sl(),sl()));
  sl.registerLazySingleton<LogOutDataSource>(() => LogOutDataSourceImpl(sl()));
}

Future external()async{
  final sharedPreference = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreference);
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<SharedPrefrencesConsumer>(() => SharedPrefrencesManager(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ));
}

account(){
  sl.registerFactory(() =>AccountCubit(sl(), sl(), sl(), sl(), sl(), sl(),sl()));
  sl.registerLazySingleton<GetFavMoviesListUsecase>(() => GetFavMoviesListUsecase(sl()));
  sl.registerLazySingleton<GetRatedMoviesListUsecase>(() => GetRatedMoviesListUsecase(sl()));
  sl.registerLazySingleton<GetMoviesWatchlistUsecase>(() => GetMoviesWatchlistUsecase(sl()));
  sl.registerLazySingleton<GetAccountDetailsUsecase>(() => GetAccountDetailsUsecase(sl()));
  sl.registerLazySingleton<GetTvShowsWatchlistUsecase>(() => GetTvShowsWatchlistUsecase(sl()));
  sl.registerLazySingleton<GetFavTvShowsListUsecase>(() => GetFavTvShowsListUsecase(sl()));
  sl.registerLazySingleton<GetRatedTvShowListUsecase>(() => GetRatedTvShowListUsecase(sl()));
  sl.registerLazySingleton<AccountRepository>(() => AccountRepositoryImpl(sl(),sl()));
  sl.registerLazySingleton<AccountDataSource>(() => AccountDataSourceImpl(sl()));
}

search(){

}
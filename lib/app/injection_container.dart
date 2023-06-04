import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/app_interceptors.dart';
import 'package:mo3tv/core/api/dio_consumer.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/core/shared/shared_prefrences.dart';
import 'package:mo3tv/core/shared/shared_prefrences_consumer.dart';
import 'package:mo3tv/features/account/data/datasources/account_local_datasource.dart';
import 'package:mo3tv/features/account/data/datasources/account_remote_datasource.dart';
import 'package:mo3tv/features/account/data/repositories/account_repository_impl.dart';
import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';
import 'package:mo3tv/features/account/domain/usecases/create_account_list_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/get_account_custom_list_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/get_account_custom_lists_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/get_account_data_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/get_account_details_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/get_account_lists_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/save_account_data_usecase.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_cubit/account_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_custom_list_cubit/account_custom_list_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_custom_lists_cubit/account_custom_lists_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_cubit.dart';
import 'package:mo3tv/features/account/presentation/cubit/create_list_cubit/create_list_cubit.dart';
import 'package:mo3tv/features/credits/data/datasources/credits_data_source.dart';
import 'package:mo3tv/features/credits/data/repositories/credits_repository_impl.dart';
import 'package:mo3tv/features/credits/domain/repositories/credits_repository.dart';
import 'package:mo3tv/features/credits/domain/usecases/get_media_credits_usecase.dart';
import 'package:mo3tv/features/credits/presentation/cubits/credits_cubit.dart';
import 'package:mo3tv/features/gallery/data/datasources/gallery_datasource.dart';
import 'package:mo3tv/features/gallery/data/repositories/gallery_repository_impl.dart';
import 'package:mo3tv/features/gallery/domain/repositories/gallery_repository.dart';
import 'package:mo3tv/features/gallery/domain/usecases/get_media_gallery_usecase.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_navigator_cubit/gallery_navigator_cubit.dart';
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
import 'package:mo3tv/features/movies/data/datasource/movie_local_datasource.dart';
import 'package:mo3tv/features/movies/data/datasource/movie_remote_datasource.dart';
import 'package:mo3tv/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:mo3tv/features/movies/domain/repositories/movie_repository.dart';
import 'package:mo3tv/features/movies/domain/usecases/delete_rate_movie_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movie_recommendations_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_movies_list_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_similar_movies_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/get_trending_movies_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/mark_movie_usecase.dart';
import 'package:mo3tv/features/movies/domain/usecases/rate_movie_usecase.dart';
import 'package:mo3tv/features/movies/presentation/cubit/more_movies_cubit/more_movies_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_buttons_bloc/movie_actions_bloc.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/playing_now_movie_cubit/playing_now_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/recommendations_movie_cubit/recommendations_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/similar_movies_cubit/similar_movie_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:mo3tv/features/movies/presentation/cubit/trending_movie_cubit/trending_movie_cubit.dart';
import 'package:mo3tv/features/reviews/data/datasources/reviews_data_source.dart';
import 'package:mo3tv/features/reviews/data/repositories/reviews_repository_impl.dart';
import 'package:mo3tv/features/reviews/domain/repositories/reviews_repository.dart';
import 'package:mo3tv/features/reviews/domain/usecases/get_media_reviews_usecase.dart';
import 'package:mo3tv/features/reviews/presentation/cubits/reviews_cubit.dart';
import 'package:mo3tv/features/search/data/datasources/search_local_data_source.dart';
import 'package:mo3tv/features/search/data/datasources/search_remote_datasource.dart';
import 'package:mo3tv/features/search/data/repositories/search_repository_impl.dart';
import 'package:mo3tv/features/search/domain/repositories/search_repository.dart';
import 'package:mo3tv/features/search/domain/usecases/clear_one_search_usecase.dart';
import 'package:mo3tv/features/search/domain/usecases/clear_search_list_usecase.dart';
import 'package:mo3tv/features/search/domain/usecases/get_search_list_usecase.dart';
import 'package:mo3tv/features/search/domain/usecases/save_search_usecase.dart';
import 'package:mo3tv/features/search/domain/usecases/search_usecase.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_bloc/search_bloc.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_list_cubit/search_list_cubit.dart';
import 'package:mo3tv/features/settings/data/datasources/lang_local_datasource.dart';
import 'package:mo3tv/features/settings/data/repositories/lang_repository_impl.dart';
import 'package:mo3tv/features/settings/domain/repositories/lang_repository.dart';
import 'package:mo3tv/features/settings/domain/usecases/change_lang_usecase.dart';
import 'package:mo3tv/features/settings/domain/usecases/get_saved_lang.dart';
import 'package:mo3tv/features/settings/presentation/cubits/locale_cubit/locale_cubit.dart';
import 'package:mo3tv/features/tv/data/datasource/tv_show_local_datasource.dart';
import 'package:mo3tv/features/tv/data/datasource/tv_show_remote_datasource.dart';
import 'package:mo3tv/features/tv/data/repositories/tv_repository_impl.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';
import 'package:mo3tv/features/tv/domain/usecases/delete_tv_show_rate_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_shows_list_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_similar_tv_shows_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_trending_tv_shows_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_recommendations_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_show_details_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/get_tv_show_season_details_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/mark_tv_show_usecase.dart';
import 'package:mo3tv/features/tv/domain/usecases/rate_tv_show_usecase.dart';
import 'package:mo3tv/features/tv/presentation/cubit/more_tv_shows_cubit/more_tv_shows_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/playing_now_tv_show_cubit/playing_now_tv_show_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/popular_tv_show_cubit/popular_tv_show_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/recommendations_tv_cubit/recommendations_tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/season_cubit/season_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/similar_tv_shows_cubit/similar_tv_show_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/top_rated_tv_show_cubit/top_rated_tv_show_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/trending_tv_show_cubit/trending_tv_show_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_buttons_bloc/tv_actions_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
final sl = GetIt.instance;
Future<void> init() async {
  lang();
  movie();
  tv();
  account();
  gallery();
  reviews();
  credits();
  search();
  logout();
  await external();
}
login(){
  if (!GetIt.I.isRegistered<GetTokenUsecase>())
    {
      sl.registerFactory<LoginCubit>(() =>LoginCubit(sl(),sl()));
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
  sl.registerFactory(() =>AccountCubit(sl(),sl(),sl()));
  sl.registerFactory(() =>AccountListsCubit(sl()));
  sl.registerFactory(() =>CreateListCubit(sl()));
  sl.registerFactory(() =>AccountCustomListsCubit(sl()));
  sl.registerFactory(() =>AccountCustomListCubit(sl()));
  sl.registerLazySingleton<GetAccountListsUsecase>(() => GetAccountListsUsecase(sl()));
  sl.registerLazySingleton<SaveAccountDataUsecase>(() => SaveAccountDataUsecase(sl()));
  sl.registerLazySingleton<GetAccountDataUsecase>(() => GetAccountDataUsecase(sl()));
  sl.registerLazySingleton<CreateAccountListUsecase>(() => CreateAccountListUsecase(sl()));
  sl.registerLazySingleton<GetAccountCustomListsUseCase>(() => GetAccountCustomListsUseCase(sl()));
  sl.registerLazySingleton<GetAccountCustomListUseCase>(() => GetAccountCustomListUseCase(sl()));
  sl.registerLazySingleton<GetAccountDetailsUsecase>(() => GetAccountDetailsUsecase(sl()));
  sl.registerLazySingleton<AccountRepository>(() => AccountRepositoryImpl(sl(),sl(),sl()));
  sl.registerLazySingleton<AccountRemoteDataSource>(() => AccountRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<AccountLocalDataSource>(() => AccountLocalDatasourceImpl(sl()));
}
search(){
  sl.registerFactory(() =>SearchBloc(sl()));
  sl.registerFactory(() =>SearchListCubit(sl(),sl(),sl(),sl()));
  sl.registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl(sl(),sl(),sl()));
  sl.registerLazySingleton<SearchUsecase>(() => SearchUsecase(sl()));
  sl.registerLazySingleton<SaveSearchUsecase>(() => SaveSearchUsecase(sl()));
  sl.registerLazySingleton<ClearSearchListUsecase>(() => ClearSearchListUsecase(sl()));
  sl.registerLazySingleton<ClearOneSearchUsecase>(() => ClearOneSearchUsecase(sl()));
  sl.registerLazySingleton<GetSearchListUsecase>(() => GetSearchListUsecase(sl()));
  sl.registerLazySingleton<SearchRemoteDataSource>(() => SearchRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<SearchLocalDataSource>(() => SearchLocalDataSourceImpl(sl()));
}
gallery(){
  sl.registerFactory(() =>GalleryCubit(sl()));
  sl.registerFactory(() =>GalleryNavigatorCubit());
  sl.registerLazySingleton<GetMediaGalleryUsecase>(() => GetMediaGalleryUsecase(sl()));
  sl.registerLazySingleton<GalleryRepository>(() => GalleryRepositoryImpl(sl(),sl()));
  sl.registerLazySingleton<GalleryDataSource>(() => GalleryDataSourceImpl(sl()));
}
movie(){
  ///cubits
  sl.registerFactory<MovieCubit>(() => MovieCubit(sl()));
  sl.registerFactory<MovieActionsBloc>(() => MovieActionsBloc(sl(),sl(),sl()));
  sl.registerFactory<PlayingNowMovieCubit>(()=>PlayingNowMovieCubit(sl()));
  sl.registerFactory<RecommendationsMovieCubit>(()=>RecommendationsMovieCubit(sl()));
  sl.registerFactory<SimilarMovieCubit>(()=>SimilarMovieCubit(sl()));
  sl.registerFactory<TrendingMovieCubit>(()=>TrendingMovieCubit(sl()));
  sl.registerFactory<PopularMovieCubit>(()=>PopularMovieCubit(sl()));
  sl.registerFactory<TopRatedMoviesCubit>(()=>TopRatedMoviesCubit(sl()));
  sl.registerFactory<MoreMoviesCubit>(()=>MoreMoviesCubit(sl(),sl()));
  ///usecases
  sl.registerLazySingleton<GetMoviesListUsecase>(() => GetMoviesListUsecase(sl()));
  sl.registerLazySingleton<GetTrendingMoviesUsecase>(() => GetTrendingMoviesUsecase(sl()));
  sl.registerLazySingleton<GetMovieDetailsUseCase>(() => GetMovieDetailsUseCase(sl()));
  sl.registerLazySingleton<GetMovieRecommendationsUseCase>(() => GetMovieRecommendationsUseCase(sl()));
  sl.registerLazySingleton<GetSimilarMovieUseCase>(() => GetSimilarMovieUseCase(sl()));
  sl.registerLazySingleton<RateMovieUseCase>(() => RateMovieUseCase(sl()));
  sl.registerLazySingleton<DeleteRateMovieUseCase>(() => DeleteRateMovieUseCase(sl()));
  sl.registerLazySingleton<MarkMovieUsecase>(() => MarkMovieUsecase(sl()));
  ///repository
  sl.registerLazySingleton<MovieRepository>(()=>MoviesRepositoryImpl(sl(),sl(),sl()));
  ///date source
  sl.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<MovieLocalDataSource>(() => MovieLocalDataSourceImpl(sl()));
}
tv(){
  ///cubits
  sl.registerFactory<TvCubit>(() => TvCubit(sl()));
  sl.registerFactory<TvActionsBloc>(() => TvActionsBloc(sl(),sl(),sl()));
  sl.registerFactory<SeasonCubit>(() => SeasonCubit(sl()));
  sl.registerFactory<RecommendationsTvCubit>(() => RecommendationsTvCubit(sl()));
  sl.registerFactory<SimilarTvShowCubit>(() => SimilarTvShowCubit(sl()));
  sl.registerFactory<PlayingNowTvShowCubit>(()=>PlayingNowTvShowCubit(sl()));
  sl.registerFactory<TrendingTvShowCubit>(()=>TrendingTvShowCubit(sl()));
  sl.registerFactory<PopularTvShowCubit>(()=>PopularTvShowCubit(sl()));
  sl.registerFactory<TopRatedTvShowsCubit>(()=>TopRatedTvShowsCubit(sl()));
  sl.registerFactory<MoreTvShowsCubit>(()=>MoreTvShowsCubit(sl(),sl()));
  ///usecases
  sl.registerLazySingleton<GetTvShowsListUsecase>(() => GetTvShowsListUsecase(sl()));
  sl.registerLazySingleton<GetTrendingTvShowsUsecase>(() => GetTrendingTvShowsUsecase(sl()));
  sl.registerLazySingleton<GetTvShowDetailsUsecase>(() => GetTvShowDetailsUsecase(sl()));
  sl.registerLazySingleton<GetSimilarTvShowsUseCase>(() => GetSimilarTvShowsUseCase(sl()));
  sl.registerLazySingleton<GetTvRecommendationsUseCase>(() => GetTvRecommendationsUseCase(sl()));
  sl.registerLazySingleton<MarkTvShowUsecase>(() => MarkTvShowUsecase(sl()));
  sl.registerLazySingleton<DeleteTvShowRateUseCase>(() => DeleteTvShowRateUseCase(sl()));
  sl.registerLazySingleton<RateTvShowUseCase>(() => RateTvShowUseCase(sl()));
  sl.registerLazySingleton<GetTvShowSeasonDetailsUsecase>(() => GetTvShowSeasonDetailsUsecase(sl()));
  ///repository
  sl.registerLazySingleton<TvRepository>(() => TvShowRepositoryImpl(sl(),sl(),sl()));
  ///data source
  sl.registerLazySingleton<TvShowRemoteDataSource>(()=>TvShowRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<TvShowLocalDataSource>(()=>TvShowLocalDataSourceImpl(sl()));
}

reviews(){
  sl.registerFactory(() =>ReviewsCubit(sl()));
  sl.registerLazySingleton<GetMediaReviewsUsecase>(() => GetMediaReviewsUsecase(sl()));
  sl.registerLazySingleton<ReviewsRepository>(() => ReviewsRepositoryImpl(sl(),sl()));
  sl.registerLazySingleton<ReviewsDataSource>(() => ReviewsDataSourceImpl(sl()));
}
credits(){
  sl.registerFactory(() =>CreditsCubit(sl()));
  sl.registerLazySingleton<GetMediaCreditsUsecase>(() => GetMediaCreditsUsecase(sl()));
  sl.registerLazySingleton<CreditsRepository>(() => CreditsRepositoryImpl(sl(),sl()));
  sl.registerLazySingleton<CreditsDataSource>(() => CreditsDataSourceImpl(sl()));
}
lang()async {
  sl.registerFactory(() =>LocaleCubit(sl(),sl()));
  sl.registerLazySingleton<ChangeLangUseCase>(() => ChangeLangUseCase(sl()));
  sl.registerLazySingleton<GetSavedLangUseCase>(() => GetSavedLangUseCase(sl()));
  sl.registerLazySingleton<LangRepository>(() => LangRepositoryImpl(sl()));
  sl.registerLazySingleton<LangLocalDataSource>(() => LangLocaleDataSourceImpl(sl()));
}
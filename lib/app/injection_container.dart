import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mo3tv/app/bloc_observer.dart';
import 'package:mo3tv/config/themes/app_theme.dart';
import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/dio_consumer.dart';
import 'package:mo3tv/core/repository/base_repository.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/core/shared/shared_prefrences.dart';
import 'package:mo3tv/core/shared/shared_prefrences_consumer.dart';
import 'package:mo3tv/features/account/data/datasources/account_local_datasource.dart';
import 'package:mo3tv/features/account/data/datasources/account_remote_datasource.dart';
import 'package:mo3tv/features/account/data/repositories/account_repository_impl.dart';
import 'package:mo3tv/features/account/domain/repositories/account_repository.dart';
import 'package:mo3tv/features/account/domain/usecases/get_session_id_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/get_account_details_usecase.dart';
import 'package:mo3tv/features/account/domain/usecases/get_account_lists_usecase.dart';
import 'package:mo3tv/features/credits/data/datasources/credits_data_source.dart';
import 'package:mo3tv/features/credits/data/repositories/credits_repository_impl.dart';
import 'package:mo3tv/features/credits/domain/repositories/credits_repository.dart';
import 'package:mo3tv/features/credits/domain/usecases/get_media_credits_usecase.dart';
import 'package:mo3tv/features/gallery/data/datasources/gallery_datasource.dart';
import 'package:mo3tv/features/gallery/data/repositories/gallery_repository_impl.dart';
import 'package:mo3tv/features/gallery/domain/repositories/gallery_repository.dart';
import 'package:mo3tv/features/gallery/domain/usecases/get_media_gallery_usecase.dart';
import 'package:mo3tv/features/auth/data/datasources/login_local_datasource.dart';
import 'package:mo3tv/features/auth/data/datasources/login_remote_datasource.dart';
import 'package:mo3tv/features/auth/data/datasources/log_out_datasource.dart';
import 'package:mo3tv/features/auth/data/datasources/log_out_local_datasource.dart';
import 'package:mo3tv/features/auth/data/repositories/log_out_repository_impl.dart';
import 'package:mo3tv/features/auth/domain/repositories/log_out_repository.dart';
import 'package:mo3tv/features/auth/domain/usecases/log_out_usecase.dart';
import 'package:mo3tv/features/auth/data/repositories/login_repository_impl.dart';
import 'package:mo3tv/features/auth/domain/repositories/login_repository.dart';
import 'package:mo3tv/features/auth/domain/usecases/get_sessionid_usecase.dart';
import 'package:mo3tv/features/auth/domain/usecases/get_token_usecase.dart';
import 'package:mo3tv/features/media/data/datasources/media_remote_datasource.dart';
import 'package:mo3tv/features/media/data/repositories/media_repository_impl.dart';
import 'package:mo3tv/features/media/domain/repositories/media_repository.dart';
import 'package:mo3tv/features/media/domain/usecases/delete_rate_media_usecase.dart';
import 'package:mo3tv/features/media/domain/usecases/get_discover_media_list.dart';
import 'package:mo3tv/features/media/domain/usecases/get_media_list_usecase.dart';
import 'package:mo3tv/features/media/domain/usecases/get_similar_media_usecase.dart';
import 'package:mo3tv/features/media/domain/usecases/mark_media_usecase.dart';
import 'package:mo3tv/features/media/domain/usecases/rate_media_usecase.dart';
import 'package:mo3tv/features/media/data/datasources/movie_remote_datasource.dart';
import 'package:mo3tv/features/media/data/repositories/movies_repository_impl.dart';
import 'package:mo3tv/features/media/domain/repositories/movie_repository.dart';
import 'package:mo3tv/features/media/domain/usecases/get_movie_details_usecase.dart';
import 'package:mo3tv/features/on_boarding/data/datasources/genres_local_datasource.dart';
import 'package:mo3tv/features/on_boarding/data/repositories/genres_repository_impl.dart';
import 'package:mo3tv/features/on_boarding/domain/repositories/genres_repository.dart';
import 'package:mo3tv/features/on_boarding/domain/usecases/get_genres_usecase.dart';
import 'package:mo3tv/features/on_boarding/domain/usecases/save_genres_usecase.dart';
import 'package:mo3tv/features/reviews/data/datasources/reviews_data_source.dart';
import 'package:mo3tv/features/reviews/data/repositories/reviews_repository_impl.dart';
import 'package:mo3tv/features/reviews/domain/repositories/reviews_repository.dart';
import 'package:mo3tv/features/reviews/domain/usecases/get_media_reviews_usecase.dart';
import 'package:mo3tv/features/search/data/datasources/search_local_data_source.dart';
import 'package:mo3tv/features/search/data/datasources/search_remote_datasource.dart';
import 'package:mo3tv/features/search/data/repositories/search_repository_impl.dart';
import 'package:mo3tv/features/search/domain/repositories/search_repository.dart';
import 'package:mo3tv/features/search/domain/usecases/clear_one_search_usecase.dart';
import 'package:mo3tv/features/search/domain/usecases/clear_search_list_usecase.dart';
import 'package:mo3tv/features/search/domain/usecases/get_search_list_usecase.dart';
import 'package:mo3tv/features/search/domain/usecases/save_search_usecase.dart';
import 'package:mo3tv/features/search/domain/usecases/search_usecase.dart';
import 'package:mo3tv/features/media/data/datasources/tv_show_remote_datasource.dart';
import 'package:mo3tv/features/media/data/repositories/tv_repository_impl.dart';
import 'package:mo3tv/features/media/domain/repositories/tv_repository.dart';
import 'package:mo3tv/features/media/domain/usecases/get_tv_show_details_usecase.dart';
import 'package:mo3tv/features/media/domain/usecases/get_tv_show_season_details_usecase.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  AppTheme.systemChrome();
  Bloc.observer = AppBlocObserver();
  await _external();
  _genres();
  _media();
  _movie();
  _tv();
  _account();
  _gallery();
  _reviews();
  _credits();
  _search();
  _login();
  _logout();
  await sl<GetSavedSessionIdUsecase>().call();
}

_login() {
  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(sl(), sl(), sl(), sl()));
  sl.registerLazySingleton<GetTokenUsecase>(() => GetTokenUsecase(sl()));
  sl.registerLazySingleton<GetSessionIdUsecase>(
      () => GetSessionIdUsecase(sl()));
  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<LoginLocalDataSource>(
      () => LoginLocalDataSourceImpl(sl()));
}

_logout() {
  sl.registerLazySingleton<LogOutUsecase>(() => LogOutUsecase(sl()));
  sl.registerLazySingleton<LogOutRepository>(
      () => LogOutRepositoryImpl(sl(), sl(), sl()));
  sl.registerLazySingleton<LogOutRemoteDataSource>(
      () => LogOutRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<LogOutLocalDataSource>(
      () => LogOutLocalDataSourceImpl(sl()));
}

Future _external() async {
  await Hive.initFlutter();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  final SharedPreferences sharedPreference =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreference);
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<BaseRepository>(() => BaseRepositoryImpl(sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<SharedPrefrencesConsumer>(
      () => SharedPrefrencesManager(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker.createInstance(
      checkInterval: const Duration(milliseconds: 3500)));
}

_account() {
  sl.registerLazySingleton<GetAccountListsUsecase>(
      () => GetAccountListsUsecase(sl()));
  sl.registerLazySingleton<GetSavedSessionIdUsecase>(
      () => GetSavedSessionIdUsecase(sl()));
  sl.registerLazySingleton<GetAccountDetailsUsecase>(
      () => GetAccountDetailsUsecase(sl()));
  sl.registerLazySingleton<AccountRepository>(
      () => AccountRepositoryImpl(sl(), sl(), sl()));
  sl.registerLazySingleton<AccountRemoteDataSource>(
      () => AccountRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<AccountLocalDataSource>(
      () => AccountLocalDatasourceImpl(sl()));
}

_search() {
  sl.registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(sl(), sl(), sl()));
  sl.registerLazySingleton<SearchUsecase>(() => SearchUsecase(sl()));
  sl.registerLazySingleton<SaveSearchUsecase>(() => SaveSearchUsecase(sl()));
  sl.registerLazySingleton<ClearSearchListUsecase>(
      () => ClearSearchListUsecase(sl()));
  sl.registerLazySingleton<ClearOneSearchUsecase>(
      () => ClearOneSearchUsecase(sl()));
  sl.registerLazySingleton<GetSearchListUsecase>(
      () => GetSearchListUsecase(sl()));
  sl.registerLazySingleton<SearchRemoteDataSource>(
      () => SearchRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<SearchLocalDataSource>(
      () => SearchLocalDataSourceImpl(sl()));
}

_gallery() {
  sl.registerLazySingleton<GetMediaGalleryUsecase>(
      () => GetMediaGalleryUsecase(sl()));
  sl.registerLazySingleton<GalleryRepository>(
      () => GalleryRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<GalleryDataSource>(
      () => GalleryDataSourceImpl(sl()));
}

_movie() {
  ///usecases
  sl.registerLazySingleton<GetMovieDetailsUseCase>(
      () => GetMovieDetailsUseCase(sl()));

  ///repository
  sl.registerLazySingleton<MovieRepository>(
      () => MoviesRepositoryImpl(sl(), sl()));

  ///date source
  sl.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(sl()));
}

_tv() {
  ///usecases
  sl.registerLazySingleton<GetTvShowDetailsUsecase>(
      () => GetTvShowDetailsUsecase(sl()));
  sl.registerLazySingleton<GetTvShowSeasonDetailsUsecase>(
      () => GetTvShowSeasonDetailsUsecase(sl()));

  ///repository
  sl.registerLazySingleton<TvRepository>(
      () => TvShowRepositoryImpl(sl(), sl()));

  ///data source
  sl.registerLazySingleton<TvShowRemoteDataSource>(
      () => TvShowRemoteDataSourceImpl(sl()));
}

_reviews() {
  sl.registerLazySingleton<GetMediaReviewsUsecase>(
      () => GetMediaReviewsUsecase(sl()));
  sl.registerLazySingleton<ReviewsRepository>(
      () => ReviewsRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<ReviewsDataSource>(
      () => ReviewsDataSourceImpl(sl()));
}

_credits() {
  sl.registerLazySingleton<GetMediaCreditsUsecase>(
      () => GetMediaCreditsUsecase(sl()));
  sl.registerLazySingleton<CreditsRepository>(
      () => CreditsRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<CreditsDataSource>(
      () => CreditsDataSourceImpl(sl()));
}

_media() {
  sl.registerLazySingleton<GetMediaListUsecase>(
      () => GetMediaListUsecase(sl()));
  sl.registerLazySingleton<GetDiscoverMediaListUsecase>(
      () => GetDiscoverMediaListUsecase(sl()));
  sl.registerLazySingleton<GetSimilarMediaListUsecase>(
      () => GetSimilarMediaListUsecase(sl()));
  sl.registerLazySingleton<DeleteRateMediaUseCase>(
      () => DeleteRateMediaUseCase(sl()));
  sl.registerLazySingleton<MarkMediaUsecase>(() => MarkMediaUsecase(sl()));
  sl.registerLazySingleton<RateMediaUseCase>(() => RateMediaUseCase(sl()));
  sl.registerLazySingleton<MediaRepository>(
      () => MediaRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<MediaRemoteDataSource>(
      () => MediaRemoteDataSourceImpl(sl()));
}

_genres() {
  sl.registerLazySingleton<GenresLocalDataSource>(
      () => GenresLocalDataSourceImpl());
  sl.registerLazySingleton<GenresRepository>(() => GenresRepositoryImpl(sl()));
  sl.registerLazySingleton<SaveGenresUseCase>(() => SaveGenresUseCase(sl()));
  sl.registerLazySingleton<GetGenresUseCase>(() => GetGenresUseCase(sl()));
}
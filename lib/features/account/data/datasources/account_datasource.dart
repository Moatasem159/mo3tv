import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/account/data/models/account_model.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';
import 'package:mo3tv/features/tv/data/models/tv_show_model.dart';
abstract class AccountDataSource {
  Future<AccountModel> getAccountDetails();
  Future<List<MovieModel>> getRatedMovies();
  Future<List<MovieModel>> getFavouriteMovies();
  Future<List<MovieModel>> getMovieWatchList();
  Future<List<TvShowModel>> getRatedTvShows();
  Future<List<TvShowModel>> getFavouriteTvShows();
  Future<List<TvShowModel>> getTvShowsWatchList();
}
class AccountDataSourceImpl extends AccountDataSource{
  final ApiConsumer _apiConsumer;
  AccountDataSourceImpl(this._apiConsumer);
  @override
  Future<List<MovieModel>> getFavouriteMovies()async {
    final res=await _apiConsumer.get(EndPoints.favMediaListPath(AppStrings.sessionId,"movies"));
    return List<MovieModel>.from((res['results'] as List).map((x) => MovieModel.fromJson(x)));
  }
  @override
  Future<List<MovieModel>> getMovieWatchList()async {
    final res=await _apiConsumer.get(EndPoints.mediaWatchListPath(AppStrings.sessionId,"movies"));
    return List<MovieModel>.from((res['results'] as List).map((x)=>MovieModel.fromJson(x)));
  }
  @override
  Future<List<MovieModel>> getRatedMovies()async {
    final res=await _apiConsumer.get(EndPoints.ratedMediaListPath(AppStrings.sessionId,"movies"));
    return List<MovieModel>.from((res['results'] as List).map((x) => MovieModel.fromJson(x)));
  }
  @override
  Future<AccountModel> getAccountDetails() async{
    final res=await _apiConsumer.get(EndPoints.accountPath(AppStrings.sessionId));
    return AccountModel.fromJson(res);
  }
  @override
  Future<List<TvShowModel>> getFavouriteTvShows() async{
    final res=await _apiConsumer.get(EndPoints.favMediaListPath(AppStrings.sessionId,"tv"));
    return List<TvShowModel>.from((res['results'] as List).map((x) => TvShowModel.fromJson(x)));
  }
  @override
  Future<List<TvShowModel>> getRatedTvShows() async{
    final res=await _apiConsumer.get(EndPoints.ratedMediaListPath(AppStrings.sessionId,"tv"));
    return List<TvShowModel>.from((res['results'] as List).map((x) => TvShowModel.fromJson(x)));
  }
  @override
  Future<List<TvShowModel>> getTvShowsWatchList()async {
    final res=await _apiConsumer.get(EndPoints.mediaWatchListPath(AppStrings.sessionId,"tv"));
    return List<TvShowModel>.from((res['results'] as List).map((x) => TvShowModel.fromJson(x)));
  }
}
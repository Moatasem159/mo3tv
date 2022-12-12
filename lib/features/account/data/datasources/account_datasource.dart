import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';

abstract class AccountDataSource{
Future<List<MovieModel>> getRatedMovies();
Future<List<MovieModel>> getFavouriteMovies();
Future<List<MovieModel>> getMovieWatchList();
}


class AccountDataSourceImpl extends AccountDataSource{
  ApiConsumer apiConsumer;


  AccountDataSourceImpl(this.apiConsumer);

  @override
  Future<List<MovieModel>> getFavouriteMovies()async {
    final res=await apiConsumer.get(EndPoints.favMoviesListPath(AppStrings.sessionId));
    return List<MovieModel>.from(
      (res['results'] as List).map(
            (x) => MovieModel.fromJson(x),
      ),
    );
  }

  @override
  Future<List<MovieModel>> getMovieWatchList()async {
    final res=await apiConsumer.get(EndPoints.moviesWatchListPath(AppStrings.sessionId));
    return List<MovieModel>.from(
      (res['results'] as List).map(
            (x) => MovieModel.fromJson(x),
      ),
    );
  }

  @override
  Future<List<MovieModel>> getRatedMovies()async {
    final res=await apiConsumer.get(EndPoints.ratedMoviesListPath(AppStrings.sessionId));
    return List<MovieModel>.from(
      (res['results'] as List).map(
            (x) => MovieModel.fromJson(x),
      ),
    );
  }
  
  
  
}
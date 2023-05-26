import 'package:mo3tv/core/shared/shared_prefrences_consumer.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
abstract class MovieLocalDataSource {
  Future<bool> saveMovieList({required List<Movie> movies, required String listType});
  Future<List<Movie>> getCachedMoviesList({required String listType});
}
class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  final SharedPrefrencesConsumer _sharedPrefrencesConsumer;
  MovieLocalDataSourceImpl(this._sharedPrefrencesConsumer);
  @override
  Future<bool> saveMovieList({required List<Movie> movies,required String listType}) async{
    final String decodedMovies=MovieModel.encode(movies as List<MovieModel>);
    await _sharedPrefrencesConsumer.saveData(key: "movie${listType}time",value: DateTime.now().toIso8601String());
    final res=await _sharedPrefrencesConsumer.saveData(key:"movie$listType", value: decodedMovies);
    return res;
  }
  @override
  Future<List<Movie>> getCachedMoviesList({required String listType})async{
    late List<Movie> movies;
    final String movieString = await _sharedPrefrencesConsumer.getData(key:"movie$listType")??'';
    final String time = await _sharedPrefrencesConsumer.getData(key:"movie${listType}time")??'';
    if(movieString.isNotEmpty)
    {
      if(DateTime.now().difference(DateTime.parse(time)).inHours>5)
      {
        await _sharedPrefrencesConsumer.remove(key:"movie$listType");
        movies=[];
        return movies;
      }
      else
      {
        movies=[];
        movies=MovieModel.decode(movieString);
        return movies;
      }
    }
    else
    {
      movies=[];
      return movies;
    }
  }
}
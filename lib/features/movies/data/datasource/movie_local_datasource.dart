import 'package:mo3tv/core/shared/shared_prefrences_consumer.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
abstract class MovieLocalDataSource {
  Future<bool> saveMovieList({required List<Movie> movies, required String listType,required String lang});
  Future<List<Movie>> getCachedMoviesList({required String listType,required String currantLang});
}
class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  final SharedPrefrencesConsumer _sharedPrefrencesConsumer;
  MovieLocalDataSourceImpl(this._sharedPrefrencesConsumer);
  @override
  Future<bool> saveMovieList({required List<Movie> movies,required String listType,required String lang}) async{
    final String decodedMovies=MovieModel.encode(movies as List<MovieModel>);
    await _sharedPrefrencesConsumer.saveData(key: "movie${listType}time",value: DateTime.now().toIso8601String());
    await _sharedPrefrencesConsumer.saveData(key: "movie${listType}lang",value: lang);
    final res=await _sharedPrefrencesConsumer.saveData(key:"movie$listType", value: decodedMovies);
    return res;
  }
  @override
  Future<List<Movie>> getCachedMoviesList({required String listType,required String currantLang})async{
    late List<Movie> movies;
    final String lang = await _sharedPrefrencesConsumer.getData(key:"movie${listType}lang")??'';
    final String time = await _sharedPrefrencesConsumer.getData(key:"movie${listType}time")??'';
    if(lang==currantLang&&DateTime.now().difference(DateTime.parse(time)).inHours<5)
      {
        final String movieString = await _sharedPrefrencesConsumer.getData(key:"movie$listType")??'';
        if(movieString.isNotEmpty)
          {
            movies=MovieModel.decode(movieString);
            return movies;
          }
        else{
          movies=[];
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
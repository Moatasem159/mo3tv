import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/media/data/models/movie_model.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
abstract class MovieRemoteDataSource {
  Future<MovieModel> getMovieDetails(MediaParams params);
}
class MovieRemoteDataSourceImpl implements MovieRemoteDataSource{
  final ApiConsumer _apiConsumer;
  const MovieRemoteDataSourceImpl(this._apiConsumer);
  @override
  Future<MovieModel> getMovieDetails(MediaParams params)async{
    final dynamic response=await _apiConsumer.get(EndPoints.mediaDetailsPath(AppStrings.sessionId,params));
    return MovieModel.fromJson(response)..productionCompanies.removeWhere((e) =>e.logoPath=='');
  }
  }
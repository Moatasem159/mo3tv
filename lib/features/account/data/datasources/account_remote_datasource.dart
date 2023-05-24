import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/account/data/models/account_model.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';
import 'package:mo3tv/features/tv/data/models/tv_show_model.dart';
abstract class AccountRemoteDataSource {
  Future<AccountModel> getAccountDetails({required String sessionId});
  Future<List> getAccountList({required String listType,required String mediaType});
}
class AccountRemoteDataSourceImpl implements AccountRemoteDataSource{
  final ApiConsumer _apiConsumer;
  AccountRemoteDataSourceImpl(this._apiConsumer);
  @override
  Future<AccountModel> getAccountDetails({required String sessionId}) async{
    final res=await _apiConsumer.get(EndPoints.accountPath(sessionId));
    return AccountModel.fromJson(res);
  }
  @override
  Future<List> getAccountList({required String listType,required String mediaType})async {
    final res=await _apiConsumer.get(EndPoints.accountMediaListPath(AppStrings.sessionId,mediaType,listType));
    if(mediaType=='movies')
      {
        return List<MovieModel>.from((res['results'] as List).map((x) => MovieModel.fromJson(x)));
      }
    else{
      return List<TvShowModel>.from((res['results'] as List).map((x) => TvShowModel.fromJson(x)));
    }
  }
}
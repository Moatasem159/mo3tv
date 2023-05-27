import 'package:mo3tv/core/shared/shared_prefrences_consumer.dart';
import 'package:mo3tv/features/tv/data/models/tv_show_model.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
abstract class TvShowLocalDataSource {
  Future<bool> saveTvShowsList({required List<TvShow> tvShows, required String listType});
  Future<List<TvShow>> getCachedTvShowsList({required String listType});
}
class TvShowLocalDataSourceImpl implements TvShowLocalDataSource {
  final SharedPrefrencesConsumer _sharedPrefrencesConsumer;
  TvShowLocalDataSourceImpl(this._sharedPrefrencesConsumer);
  @override
  Future<bool> saveTvShowsList({required List<TvShow> tvShows,required String listType}) async{
    final String decodedTvShows=TvShowModel.encode(tvShows as List<TvShowModel>);
    await _sharedPrefrencesConsumer.saveData(key:"tvShow${listType}time",value: DateTime.now().toIso8601String());
    final res=await _sharedPrefrencesConsumer.saveData(key:"tvShow$listType", value: decodedTvShows);
    return res;
  }
  @override
  Future<List<TvShow>> getCachedTvShowsList({required String listType})async{
    late List<TvShow> tvShows;
    final String tvShowString = await _sharedPrefrencesConsumer.getData(key:"tvShow$listType")??'';
    final String time = await _sharedPrefrencesConsumer.getData(key:"tvShow${listType}time")??'';
    if(tvShowString.isNotEmpty)
    {
      if(DateTime.now().difference(DateTime.parse(time)).inHours>=5)
      {
        await _sharedPrefrencesConsumer.remove(key:"tvShow$listType");
        tvShows=[];
        return tvShows;
      }
      else
      {
        tvShows=[];
        tvShows=TvShowModel.decode(tvShowString);
        return tvShows;
      }
    }
    else
    {
      tvShows=[];
      return tvShows;
    }
  }
}
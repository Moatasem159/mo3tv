import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/execute_and_handle_errors.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/features/tv/data/datasource/tv_show_remote_datasource.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';
class TvShowRepositoryImpl implements TvRepository{
  final TvShowRemoteDataSource _tvShowRemoteDataSource;
  final NetworkInfo _networkInfo;
  const TvShowRepositoryImpl(this._tvShowRemoteDataSource,this._networkInfo);
  @override
  Future<Either<Failure, List<TvShow>>> getTvShowsList(MediaParams params)async {
     return executeAndHandleError<List<TvShow>>(() => _tvShowRemoteDataSource.getTvShowsList(params),_networkInfo);
  }
  @override
  Future<Either<Failure, List<TvShow>>> getTrendingTvShows(MediaParams params) async{
    return executeAndHandleError<List<TvShow>>(() => _tvShowRemoteDataSource.getTrendingTvShows(params),_networkInfo);
  }
  @override
  Future<Either<Failure, TvShow>> getTvShowDetails(MediaParams params)async {
    return executeAndHandleError<TvShow>(() => _tvShowRemoteDataSource.getTvShowDetails(params),_networkInfo);
  }
  @override
  Future<Either<Failure, TvShowSeason>> getTvShowSeasonDetails(MediaParams params)async {
    return executeAndHandleError<TvShowSeason>(() => _tvShowRemoteDataSource.getTvShowSeasonDetails(params),_networkInfo);
  }
  @override
  Future<Either<Failure, List<TvShow>>> getTvShowRecommendations(MediaParams params)async {
    return executeAndHandleError<List<TvShow>>(() => _tvShowRemoteDataSource.getTvShowRecommendations(params),_networkInfo);
  }
  @override
  Future<Either<Failure, List<TvShow>>> getSimilarTvShows(MediaParams params) async{
    return executeAndHandleError<List<TvShow>>(() => _tvShowRemoteDataSource.getSimilarTvShows(params),_networkInfo);
  }
  @override
  Future<Either<Failure, Message>> markTvShow(MediaParams params) async{
    return executeAndHandleError<Message>(() => _tvShowRemoteDataSource.markTvShow(params),_networkInfo);
  }
  @override
  Future<Either<Failure, Message>> deleteTvShowRate(MediaParams params) async{
    return executeAndHandleError<Message>(() => _tvShowRemoteDataSource.deleteTvShowRate(params),_networkInfo);
  }
  @override
  Future<Either<Failure, Message>> rateTvShow(MediaParams params) async{
    return executeAndHandleError<Message>(() => _tvShowRemoteDataSource.rateTvShow(params),_networkInfo);
  }
}
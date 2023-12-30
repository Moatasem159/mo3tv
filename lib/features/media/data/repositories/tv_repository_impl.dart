import 'package:dartz/dartz.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/execute_and_handle_errors.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/features/media/data/datasources/tv_show_remote_datasource.dart';
import 'package:mo3tv/features/media/domain/entities/tv_show.dart';
import 'package:mo3tv/features/media/domain/entities/tv_show_season.dart';
import 'package:mo3tv/features/media/domain/repositories/tv_repository.dart';
class TvShowRepositoryImpl implements TvRepository{
  final TvShowRemoteDataSource _tvShowRemoteDataSource;
  final NetworkInfo _networkInfo;
  const TvShowRepositoryImpl(this._tvShowRemoteDataSource,this._networkInfo);
  @override
  Future<Either<Failure, TvShow>> getTvShowDetails(MediaParams params)async {
    return executeAndHandleError<TvShow>(() => _tvShowRemoteDataSource.getTvShowDetails(params),_networkInfo);
  }
  @override
  Future<Either<Failure, TvShowSeason>> getTvShowSeasonDetails(MediaParams params)async {
    return executeAndHandleError<TvShowSeason>(() => _tvShowRemoteDataSource.getTvShowSeasonDetails(params),_networkInfo);
  }

}
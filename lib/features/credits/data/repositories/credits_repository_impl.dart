import 'package:dartz/dartz.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/functions/execute_and_handle_errors.dart';
import 'package:mo3tv/core/network/network_info.dart';
import 'package:mo3tv/features/credits/data/datasources/credits_data_source.dart';
import 'package:mo3tv/features/credits/domain/entities/cast.dart';
import 'package:mo3tv/features/credits/domain/repositories/credits_repository.dart';
class CreditsRepositoryImpl implements CreditsRepository{
  final NetworkInfo _networkInfo;
  final CreditsDataSource _creditsDataSource;
  const CreditsRepositoryImpl(this._networkInfo, this._creditsDataSource);
  @override
  Future<Either<Failure,List<CastMember>>> getMediaCredits(MediaParams params)async{
    return executeAndHandleError<List<CastMember>>(() => _creditsDataSource.getMediaCredits(params),_networkInfo);
  }
}
import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/entities/cast.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';
class GetTvShowCreditsUsecase{
  final TvRepository _tvRepository;
  GetTvShowCreditsUsecase(this._tvRepository);
  Future<Either<Failure,List<CastMember>>> call({required int tvId}) async{
    return await _tvRepository.getTvShowCredits(tvId:tvId);
  }
}
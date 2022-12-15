import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/usecase/base_usecase.dart';
import 'package:mo3tv/core/entities/cast.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';

class GetTvShowCreditsUsecase extends BaseUsecase{
  final TvRepository tvRepository;
  GetTvShowCreditsUsecase(this.tvRepository);
  @override
  Future<Either<Failure,List<CastMember>>> call(parameters) async{
    return await tvRepository.getTvShowCredits(tvId:parameters);
  }
}
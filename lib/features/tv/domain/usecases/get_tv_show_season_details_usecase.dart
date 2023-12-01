import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';
class GetTvShowSeasonDetailsUsecase{
  final TvRepository _tvRepository;
  const GetTvShowSeasonDetailsUsecase(this._tvRepository);
  Future<Either<Failure, TvShowSeason>> call(
      {required int tvId,required int seasonNumber,required String lang}) async=>
  await _tvRepository.getTvShowSeasonDetails(seasonNumber: seasonNumber, tvShowId: tvId,lang: lang);
}
import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';

class GetTvShowSeasonDetailsUsecase{
  final TvRepository tvRepository;
  GetTvShowSeasonDetailsUsecase(this.tvRepository);
  Future<Either<Failure, TvShowSeason>> call({required int tvId,required int seasonNumber}) async{
    return await tvRepository.getTvShowSeasonDetails(seasonNumber: seasonNumber, tvShowId: tvId);
  }
}
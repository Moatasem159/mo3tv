import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';
class GetNowPlayingTvShowsUsecase{
  final TvRepository _tvRepository;
  GetNowPlayingTvShowsUsecase(this._tvRepository);
  Future<Either<Failure,List<TvShow>>> call({required int page}) async{
    return await _tvRepository.getNowPlayingTvShows(page: page);
  }
}
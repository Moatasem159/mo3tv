import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';
class GetPopularTvShowsUsecase{
  final TvRepository _tvRepository;
  GetPopularTvShowsUsecase(this._tvRepository);
  Future<Either<Failure,List<TvShow>>> call({required int page}) async{
    return await _tvRepository.getPopularTvShows(page: page);
  }
}
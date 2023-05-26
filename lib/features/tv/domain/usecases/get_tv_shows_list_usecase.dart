import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';
class GetTvShowsListUsecase{
  final TvRepository _tvRepository;
  GetTvShowsListUsecase(this._tvRepository);
  Future<Either<Failure,List<TvShow>>> call({int page=1,required String listType}) async{
    return await _tvRepository.getNowPlayingTvShows(page: page,listType: listType);
  }
}
import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';
class MarkTvShowAsFavUsecase{
  final TvRepository _tvRepository;
  MarkTvShowAsFavUsecase(this._tvRepository);
  Future<Either<Failure, Message>> call({required int tvId,required bool fav}) async{
    return await _tvRepository.markTvShowFav(tvId:tvId,fav: fav);
  }
}
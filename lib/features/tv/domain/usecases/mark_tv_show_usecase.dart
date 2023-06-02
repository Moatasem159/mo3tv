import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';
class MarkTvShowUsecase{
  final TvRepository _tvRepository;
  MarkTvShowUsecase(this._tvRepository);
  Future<Either<Failure, Message>> call({required int tvId,required bool mark,required String markType}) async=>
      await _tvRepository.markTvShow(tvId:tvId,mark: mark,markType:markType);
}
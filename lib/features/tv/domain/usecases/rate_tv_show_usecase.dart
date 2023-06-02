import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';
class RateTvShowUseCase{
  final TvRepository _tvRepository;
  RateTvShowUseCase(this._tvRepository);
  Future<Either<Failure, Message>> call({dynamic rate,required int tvId}) async=>
      await _tvRepository.rateTvShow(rate:rate,tvId:tvId);
}
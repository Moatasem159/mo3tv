import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';
class MarkTvShowUsecase{
  final TvRepository _tvRepository;
  const MarkTvShowUsecase(this._tvRepository);
  Future<Either<Failure, Message>> call(MediaParams params) async=> await _tvRepository.markTvShow(params);
}
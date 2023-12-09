import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';
class GetTvShowDetailsUsecase{
  final TvRepository _tvRepository;
  const GetTvShowDetailsUsecase(this._tvRepository);
  Future<Either<Failure, TvShow>> call(MediaParams params) async=>
      await _tvRepository.getTvShowDetails(params);
}
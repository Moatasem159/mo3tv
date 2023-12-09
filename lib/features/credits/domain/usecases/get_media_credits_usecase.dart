import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/entities/media_params.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/credits/domain/entities/cast.dart';
import 'package:mo3tv/features/credits/domain/repositories/credits_repository.dart';
class GetMediaCreditsUsecase {
  final CreditsRepository _creditsRepository;
  const GetMediaCreditsUsecase(this._creditsRepository);
  Future<Either<Failure, List<CastMember>>> call(MediaParams params) async=> await _creditsRepository.getMediaCredits(params);
}
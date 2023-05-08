import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/credits/domain/entities/cast.dart';
import 'package:mo3tv/features/credits/domain/repositories/credits_repository.dart';
class GetMediaCreditsUsecase {
  final CreditsRepository _creditsRepository;
  GetMediaCreditsUsecase(this._creditsRepository);
  Future<Either<Failure, List<CastMember>>> call({required int mediaId,required String mediaType}) async{
    return await _creditsRepository.getMediaCredits(mediaId:mediaId,mediaType: mediaType);
  }
}
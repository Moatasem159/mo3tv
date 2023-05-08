import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/features/credits/domain/entities/cast.dart';
abstract class CreditsRepository{
  Future<Either<Failure,List<CastMember>>> getMediaCredits({required int mediaId,required String mediaType});
}
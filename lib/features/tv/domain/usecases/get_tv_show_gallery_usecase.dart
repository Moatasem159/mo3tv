import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/usecase/base_usecase.dart';
import 'package:mo3tv/core/entities/image.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';

class GetTvShowGalleryUsecase extends BaseUsecase{
  final TvRepository tvRepository;
  GetTvShowGalleryUsecase(this.tvRepository);
  @override
  Future<Either<Failure, Gallery>> call(parameters) async{
    return await tvRepository.getTvShowGallery(tvId:parameters);
  }
}
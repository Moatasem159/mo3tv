import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/usecase/base_usecase.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';

class GetTrendingTvShowsUsecase extends BaseUsecase{
  final TvRepository tvRepository;

  GetTrendingTvShowsUsecase({required this.tvRepository});

  @override
  Future<Either<Failure,List<TvShow>>> call(parameters) async{
    return await tvRepository.getTrendingTvShows(page:parameters);
  }

}
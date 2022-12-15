import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/usecase/base_usecase.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';


class DeleteTvShowRateUseCase extends BaseUsecase{
  final TvRepository tvRepository;
  DeleteTvShowRateUseCase(this.tvRepository);
  @override
  Future<Either<Failure, Message>> call(parameters) async{
    return await tvRepository.deleteTvShowRate(tvId: parameters);
  }
}
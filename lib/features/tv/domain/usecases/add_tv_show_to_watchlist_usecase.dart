import 'package:dartz/dartz.dart';
import 'package:mo3tv/core/error/failure.dart';
import 'package:mo3tv/core/entities/message.dart';
import 'package:mo3tv/features/tv/domain/repositories/tv_repository.dart';

class AddTvShowToWatchListUseCase{
  final TvRepository tvRepository;
  AddTvShowToWatchListUseCase(this.tvRepository);

  Future<Either<Failure, Message>> call({required int tvId,required bool watchlist}) async{
    return await tvRepository.addTvShowToWatchlist(tvId:tvId,watchlist: watchlist);
  }
}
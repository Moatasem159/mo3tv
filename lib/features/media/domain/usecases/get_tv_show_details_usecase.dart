import 'package:mo3tv/core/api/api_result.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/media/domain/entities/tv_show.dart';
import 'package:mo3tv/features/media/domain/repositories/tv_repository.dart';

class GetTvShowDetailsUsecase {
  final TvRepository _tvRepository;

  const GetTvShowDetailsUsecase(this._tvRepository);

  Future<ApiResult<TvShow>> call(MediaParams params) async =>
      await _tvRepository.getTvShowDetails(params);
}
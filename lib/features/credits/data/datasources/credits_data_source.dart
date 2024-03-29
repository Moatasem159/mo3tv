import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/credits/data/models/cast_model.dart';
abstract class CreditsDataSource{
  Future<List<CastMemberModel>> getMediaCredits(MediaParams params);
}
class CreditsDataSourceImpl implements CreditsDataSource{
  final ApiConsumer _apiConsumer;
  const CreditsDataSourceImpl(this._apiConsumer);
  @override
  Future<List<CastMemberModel>> getMediaCredits(MediaParams params)async {
    final response = await _apiConsumer.get(EndPoints.mediaCreditsPath(params));
    return List<CastMemberModel>.from((response['cast'] as List).map((x) => CastMemberModel.fromJson(x)));
  }
}
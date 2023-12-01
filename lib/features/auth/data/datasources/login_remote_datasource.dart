import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/auth/data/models/session_model.dart';
import 'package:mo3tv/features/auth/data/models/token_model.dart';
abstract class LoginRemoteDataSource{
  Future<SessionModel> getSessionId({required String token});
  Future<TokenModel> getTokenRequest();
}
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource{
  final ApiConsumer _apiConsumer;
  const LoginRemoteDataSourceImpl(this._apiConsumer);
  @override
  Future<SessionModel> getSessionId({required String token}) async{
    var res=await _apiConsumer.get(EndPoints.sessionIdPath(token));
    return SessionModel.fromJson(res);
  }
  @override
  Future<TokenModel> getTokenRequest() async{
    var res=await _apiConsumer.get(EndPoints.requestTokenPath);
    return TokenModel.fromJson(res);
  }
}
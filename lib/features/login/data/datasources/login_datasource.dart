import 'package:mo3tv/core/api/api_consumer.dart';
import 'package:mo3tv/core/api/end_points.dart';
import 'package:mo3tv/features/login/data/models/session_model.dart';
import 'package:mo3tv/features/login/data/models/token_model.dart';
abstract class LoginDataSource{
  Future<SessionModel> getSessionId({required String token});
  Future<TokenModel> getTokenRequest();
}
class LoginDataSourceImpl extends LoginDataSource{
   final ApiConsumer _apiConsumer;
  LoginDataSourceImpl(this._apiConsumer);
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
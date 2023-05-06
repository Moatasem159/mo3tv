import 'package:mo3tv/features/login/domain/entities/token.dart';
class TokenModel extends Token{
  TokenModel({super.token,super.expire,super.success});
  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
    token: json["request_token"]??'',
    expire: json["expires_at"]??'',
    success: json["success"],

  );
}
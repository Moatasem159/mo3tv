import 'package:mo3tv/features/auth/domain/entities/token.dart';
class TokenModel extends Token{
  const TokenModel({required super.token,required super.expire,required super.success});
  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
    token: json["request_token"]??'',
    expire: json["expires_at"]??'',
    success: json["success"],
  );
}
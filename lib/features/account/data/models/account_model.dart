import 'package:mo3tv/features/account/domain/entities/account.dart';
class AccountModel extends Account {
  const AccountModel({
    required super.avatar,
    required super.id,
    required super.iso6391,
    required super.iso31661,
    required super.name,
    required super.username,
  });
  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
    avatar: json["avatar"]!=null?json["avatar"]["tmdb"]["avatar_path"]??'':json["avatar_path"]??'',
    id: json["id"],
    iso6391: json["iso_639_1"]??'',
    iso31661: json["iso_3166_1"]??'',
    name: json["name"] ?? '',
    username: json["username"] ?? '',
  );
  static Map<String, dynamic> accountToJson(Account accountModel) => {
    "name": accountModel.name,
    "avatar_path": accountModel.avatar,
    "iso6391": accountModel.iso6391,
    "username": accountModel.username,
    "iso31661": accountModel.iso31661,
    "id": accountModel.id,
  };
}
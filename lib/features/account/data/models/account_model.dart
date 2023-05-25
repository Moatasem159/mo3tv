import 'dart:convert';
import 'package:mo3tv/features/account/domain/entities/account.dart';
class AccountModel extends Account {
  AccountModel({
    super.avatar,
    super.id,
    super.iso6391,
    super.iso31661,
    super.name,
    super.includeAdult,
    super.username,
  });
  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
    avatar: json["avatar"]!=null?json["avatar"]["tmdb"]["avatar_path"]??'':json["avatar_path"]??'',
    id: json["id"],
    iso6391: json["iso_639_1"],
    iso31661: json["iso_3166_1"],
    name: json["name"] ?? '',
    includeAdult: json["include_adult"],
    username: json["username"] ?? '',
  );
  static AccountModel fromJsonString(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    return AccountModel.fromJson(json);
  }
  static String toJsonString(AccountModel accountModel) {
    Map<String, dynamic> json = accountToJson(accountModel);
    return jsonEncode(json);
  }
  static Map<String, dynamic> accountToJson(AccountModel accountModel) => {
    "name": accountModel.name,
    "avatar_path": accountModel.avatar,
    "iso6391": accountModel.iso6391,
    "username": accountModel.username,
    "iso31661": accountModel.iso31661,
    "includeAdult": accountModel.includeAdult,
    "id": accountModel.id,
  };
}
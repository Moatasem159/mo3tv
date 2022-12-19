import 'package:mo3tv/features/account/domain/entities/account.dart';

class AccountModel extends Account{
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
    avatar:json["avatar"]["tmdb"]["avatar_path"]??'',
    id: json["id"],
    iso6391: json["iso_639_1"],
    iso31661: json["iso_3166_1"],
    name: json["name"]??'',
    includeAdult: json["include_adult"],
    username: json["username"]??'',
  );
}
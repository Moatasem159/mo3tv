import 'package:mo3tv/features/movies/domain/entities/cast.dart';

class CastMemberModel extends CastMember{


  const CastMemberModel({
    super.id,
    super.adult,
    super.name,
  super.castId,
  super.character,
  super.creditId,
  super.gender,
  super.knownForDepartment,
  super.order,
  super.originalName,
  super.popularity,
  super.profilePath,
  });

  factory CastMemberModel.fromJson(Map<String, dynamic> json) => CastMemberModel(
    adult: json["adult"]??'',
    knownForDepartment: json["known_for_department"]??'',
    name: json["name"]??'',
    id: json["id"]??0,
    castId: json["cast_id"]??0,
    creditId: json["credit_id"]??0,
    originalName: json["original_name"]??'',
    character: json["character"]??'',
    popularity: json["popularity"]??0,
    gender: json["gender"]??0,
    order: json["order"]??0,
    profilePath: json["profile_path"]??'',
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "known_for_department": knownForDepartment,
    "name": name,
    "id": id,
    "cast_id": castId,
    "credit_id": creditId,
    "original_name": originalName,
    "popularity": popularity,
    "character": character,
    "order": order,
    "gender": gender,
    "profilePath": profilePath,

  };
}
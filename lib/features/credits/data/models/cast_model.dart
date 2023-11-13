import 'package:mo3tv/features/credits/domain/entities/cast.dart';
class CastMemberModel extends CastMember {
  const CastMemberModel({
    required super.id,
    required super.gender,
    required super.knownForDepartment,
    required super.name,
    required super.originalName,
    required super.popularity,
    required super.profilePath,
    required super.castId,
    required super.character,
    required super.creditId,
    required super.order,
    required super.department,
    required super.job,
  });
  factory CastMemberModel.fromJson(Map<String, dynamic> json) =>
      CastMemberModel(
        knownForDepartment: json["known_for_department"] ?? '',
        name: json["name"] ?? '',
        id: json["id"] ?? 0,
        castId: json["cast_id"] ?? 0,
        creditId: json["credit_id"] ?? 0,
        originalName: json["original_name"] ?? '',
        character: json["character"] ?? '',
        popularity: json["popularity"] ?? 0,
        gender: json["gender"] ?? 0,
        order: json["order"] ?? 0,
        profilePath: json["profile_path"] ?? '',
        department: json["department"] ?? '',
        job: json["job"] ?? '',
      );
}
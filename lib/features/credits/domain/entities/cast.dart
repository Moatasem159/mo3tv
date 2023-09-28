class CastMember{
  final int id;
  final int? gender;
  final String? knownForDepartment;
  final String name;
  final String? originalName;
  final dynamic popularity;
  final String? profilePath;
  final int? castId;
  final String? character;
  final String? creditId;
  final dynamic order;
  final String? department;
  final String? job;
  const CastMember(
      {required this.id,
      this.gender,
      this.knownForDepartment,
      required this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.castId,
      this.character,
      this.creditId,
      this.department,
      this.job,
      this.order});
}
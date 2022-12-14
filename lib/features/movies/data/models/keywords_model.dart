import 'package:mo3tv/features/movies/domain/entities/keyword.dart';

class GenreModel extends Keyword{
  GenreModel({
    super.id,
    super.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
    id: json["id"]??0,
    name: json["name"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
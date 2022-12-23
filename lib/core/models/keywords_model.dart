import 'package:mo3tv/core/entities/keyword.dart';

class GenreModel extends Keyword {
  GenreModel({
    super.id,
    super.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
      );
}

import 'package:mo3tv/features/media/domain/entities/keyword.dart';
class GenreModel extends Keyword {
  const GenreModel({required super.id, required super.name});
  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(id: json["id"] ?? 0,name: json["name"] ?? '');
}
import 'package:mo3tv/features/account/domain/entities/account_custom_list_item.dart';

class AccountCustomListItemModel extends AccountCustomListItem{
  AccountCustomListItemModel({
     super.backdropPath,  super.id,  super.mediaType,  super.posterPath,  super.originalTitle,  super.releaseDate,  super.title,  super.name,  super.originalName});
  factory AccountCustomListItemModel.fromJson(Map<String, dynamic> json) => AccountCustomListItemModel(
    backdropPath: json["backdrop_path"],
    id: json["id"],
    mediaType: json["media_type"],
    originalTitle: json["original_title"],
    posterPath: json["poster_path"],
    releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
    title: json["title"],
    name: json["name"],
    originalName: json["original_name"],
  );

}
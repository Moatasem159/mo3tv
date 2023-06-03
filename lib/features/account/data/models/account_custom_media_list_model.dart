import 'package:mo3tv/features/account/domain/entities/account_custom_media_list.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';
import 'package:mo3tv/features/tv/data/models/tv_show_model.dart';
class AccountCustomMediaListModel extends AccountCustomMediaList{
  const AccountCustomMediaListModel({required super.description, required super.list, required super.posterPath, required super.id, required super.itemCount, required super.name});
factory AccountCustomMediaListModel.fromJson(Map<String, dynamic> json) => AccountCustomMediaListModel(
      description: json["description"]??'',
      id: json["id"],
      name: json["name"],
      posterPath: json["poster_path"],
      list: json["items"]==null ?[]:List.from(json["items"]as List).map((e)
      {
          if(e.mediaType=="movie"){
              return MovieModel.fromJson(e);
          }
          else{
              return TvShowModel.fromJson(e);
          }
      }).toList(),
      itemCount: json["item_count"],
    );
}
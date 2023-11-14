import 'package:mo3tv/core/entities/media.dart';
import 'package:mo3tv/features/account/domain/entities/account_list_entity.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';
import 'package:mo3tv/features/tv/data/models/tv_show_model.dart';
class AccountListModel extends AccountListEntity{
  const AccountListModel({required super.page, required super.totalPages, required super.totalResults, required super.list});
  factory AccountListModel.movieListFromJson(Map<String, dynamic> json) => AccountListModel(
    list: json["results"]==null?[]:List<Media>.from(json["results"].map((x) => MovieModel.fromJson(x))),
     page: json["page"],
    totalPages: json["total_pages"],
     totalResults: json["total_results"]
  );
  factory AccountListModel.tvShowListFromJson(Map<String, dynamic> json) => AccountListModel(
    list: json["results"]==null?[]:List<Media>.from(json["results"].map((x) => TvShowModel.fromJson(x))),
     page: json["page"],
    totalPages: json["total_pages"],
     totalResults: json["total_results"]
  );
}
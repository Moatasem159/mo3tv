import 'package:mo3tv/features/account/domain/entities/account_list_entity.dart';
import 'package:mo3tv/features/movies/data/models/movie_model.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/tv/data/models/tv_show_model.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
class AccountListModel extends AccountListEntity{
  AccountListModel({required super.page, required super.totalPages, required super.totalResults, required super.list});
  factory AccountListModel.movieListFromJson(Map<String, dynamic> json) => AccountListModel(
    list: json["results"]==null?[]:List<Movie>.from(json["results"].map((x) => MovieModel.fromJson(x))),
     page: json["page"],
    totalPages: json["total_pages"],
     totalResults: json["total_results"]
  );
  factory AccountListModel.tvShowListFromJson(Map<String, dynamic> json) => AccountListModel(
    list: json["results"]==null?[]:List<TvShow>.from(json["results"].map((x) => TvShowModel.fromJson(x))),
     page: json["page"],
    totalPages: json["total_pages"],
     totalResults: json["total_results"]
  );
}
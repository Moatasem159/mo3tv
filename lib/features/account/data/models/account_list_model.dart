import 'package:mo3tv/features/media/data/models/media_model.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/features/account/domain/entities/account_list_entity.dart';
class AccountListModel extends AccountListEntity{
  const AccountListModel({required super.page, required super.totalPages, required super.totalResults, required super.list});
  factory AccountListModel.fromJson(Map<String, dynamic> json) => AccountListModel(
    list: json["results"]==null?[]:List<Media>.from(json["results"].map((x) => MediaModel.fromJson(x))),
     page: json["page"],
    totalPages: json["total_pages"],
     totalResults: json["total_results"]
  );
}
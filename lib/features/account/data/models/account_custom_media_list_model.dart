import 'package:mo3tv/features/account/data/models/account_custom_list_item_model.dart';
import 'package:mo3tv/features/account/domain/entities/account_custom_media_list.dart';
class AccountCustomMediaListModel extends AccountCustomMediaList{
  const AccountCustomMediaListModel({required super.description, required super.items, required super.posterPath, required super.id, required super.itemCount, required super.name});
factory AccountCustomMediaListModel.fromJson(Map<String, dynamic> json) => AccountCustomMediaListModel(
      description: json["description"]??'',
      id: json["id"].toString(),
      name: json["name"]??'',
      posterPath: json["poster_path"]??'',
       items: json["items"]==null?[]:List<AccountCustomListItemModel>.from(json["items"].map((x) => AccountCustomListItemModel.fromJson(x))),
      itemCount: json["item_count"]??0,
    );
}
import 'package:equatable/equatable.dart';
import 'package:mo3tv/features/account/domain/entities/account_custom_list_item.dart';
// ignore: must_be_immutable
class AccountCustomMediaList extends Equatable {
  final String? description;
  final String? id;
  int? itemCount;
  final String? name;
  final String? posterPath;
  List<AccountCustomListItem>? items;
  AccountCustomMediaList(
      {this.description,
      this.items,
      this.posterPath,
      this.id,
      this.itemCount,
      this.name});
  @override
  List<Object?> get props => [
    description, items, id, itemCount, name,posterPath];
}

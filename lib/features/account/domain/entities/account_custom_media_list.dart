import 'package:equatable/equatable.dart';
import 'package:mo3tv/features/account/domain/entities/account_custom_list_item.dart';
class AccountCustomMediaList extends Equatable {
  final String? description;
  final String? id;
  final int? itemCount;
  final String? name;
  final String? posterPath;
  final List<AccountCustomListItem>? items;
  const AccountCustomMediaList(
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

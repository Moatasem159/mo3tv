import 'package:equatable/equatable.dart';
class AccountCustomMediaList extends Equatable {
  final String? description;
  final int? id;
  final int? itemCount;
  final String? name;
  final String? posterPath;
  final List? list;
  const AccountCustomMediaList(
      {this.description,
      this.list,
      this.posterPath,
      this.id,
      this.itemCount,
      this.name});
  @override
  List<Object?> get props => [
    description, list, id, itemCount, name,posterPath];
}

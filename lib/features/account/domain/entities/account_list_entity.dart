import 'package:mo3tv/features/media/domain/entities/media.dart';
class AccountListEntity {
  final int page;
  final int totalPages;
  final int totalResults;
  final List<Media> list;
 const AccountListEntity(
      {required this.page,
      required this.totalPages,
      required this.totalResults,
      required this.list});
}

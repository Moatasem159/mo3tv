class AccountListEntity {
  final int page;
  final int totalPages;
  final int totalResults;
  final List list;
 const AccountListEntity(
      {required this.page,
      required this.totalPages,
      required this.totalResults,
      required this.list});
}

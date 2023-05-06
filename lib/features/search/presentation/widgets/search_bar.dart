import 'package:flutter/material.dart';
class SearchBar extends SliverPersistentHeaderDelegate{
  final Widget searchBar;

  SearchBar({required this.searchBar});
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return searchBar;
  }

  @override
  double get maxExtent =>60;

  @override
  double get minExtent =>60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>false;

}
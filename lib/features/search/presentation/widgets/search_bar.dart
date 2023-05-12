import 'package:flutter/material.dart';
class CustomSearchBar extends SliverPersistentHeaderDelegate{
  final Widget searchBar;

  CustomSearchBar({required this.searchBar});
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
import 'package:flutter/material.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';
import 'package:mo3tv/features/search/presentation/widgets/recently_widgets/recently_search_item.dart';
class RecentlySearchList extends StatelessWidget {
  final List<Search> recently;
  const RecentlySearchList({super.key, required this.recently});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: recently.length,
        itemBuilder: (context, index) =>RecentlySearchItem(search: recently[index]));
  }
}
import 'package:flutter/material.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';
import 'package:mo3tv/features/search/presentation/widgets/media_search_widget.dart';
class SearchList extends StatelessWidget {
  final List<Search> items;
  const SearchList({super.key, required this.items});
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: items.length,
        (context, index) {
          return MediaSearchWidget(mediaSearch: items[index]);
        },
      ),
    );
  }
}
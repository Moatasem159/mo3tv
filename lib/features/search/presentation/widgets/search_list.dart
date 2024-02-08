part of'../screens/search_screen.dart';
class _SearchList extends StatelessWidget {
  final List<Search> items;
  const _SearchList(this.items);
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: items.length,
      itemBuilder: (_, index) => _MediaSearchWidget(items[index]),
    );
  }
}
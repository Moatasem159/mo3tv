part of'../../screens/search_screen.dart';
class _RecentlySearchList extends StatelessWidget {
  final List<Search> recently;
  const _RecentlySearchList( this.recently);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: recently.length,
        itemBuilder: (context, index) =>_RecentlySearchItem(recently[index]));
  }
}
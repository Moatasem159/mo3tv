part of'media_list.dart';
class _MediaLoadingList extends StatelessWidget {
  final String title;
  const _MediaLoadingList({required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ListTitle(title: title),
        10.ph,
        SizedBox(
          height: MediaQuery.sizeOf(context).height/3.9,
          child: ListView.builder(
            itemCount: 20,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>const MediaListLoadingItem())),
        10.ph
      ],
    );
  }
}
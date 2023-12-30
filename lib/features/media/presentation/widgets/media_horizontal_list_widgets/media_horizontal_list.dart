part of 'media_list.dart';
class _MediaHorizontalList extends StatelessWidget {
  final String title;
  final String mediaType;
  final List<Media> media;
  final VoidCallback? onPressed;
  const _MediaHorizontalList({required this.title,required this.media, this.onPressed,required this.mediaType});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ListTitle(title: title,onPressed: onPressed),
        10.ph,
        SizedBox(
          height: MediaQuery.sizeOf(context).height/3.9,
          child: ListView.builder(
            itemCount: media.length,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder:(context, index) =>MediaListItem(media: media[index],mediaType: mediaType))),
        10.ph,
      ],
    );
  }
}
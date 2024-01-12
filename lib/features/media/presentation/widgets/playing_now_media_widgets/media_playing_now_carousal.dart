part of 'playing_now_media.dart';
class _MediaPlayingNowCarousal extends StatelessWidget {
  final List<Media> media;
  final String mediaType;
  const _MediaPlayingNowCarousal({required this.media, required this.mediaType});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height/3.5,
        viewportFraction: .89,
        autoPlay:true,
        autoPlayInterval: const Duration(seconds: 3)),
      items:media.map((media)=>_MediaPlayingNowCard(media:media,mediaType: mediaType)).toList());
  }
}
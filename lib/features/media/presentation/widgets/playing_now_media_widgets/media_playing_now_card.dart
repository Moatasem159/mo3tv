part of 'playing_now_media.dart';
class _MediaPlayingNowCard extends StatelessWidget {
  final Media media;
  final String mediaType;
  const _MediaPlayingNowCard({required this.media, required this.mediaType});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () =>   context.pushNamed(
            (mediaType == AppStrings.movie || mediaType == "movies")
                ? Routes.movieDetailsRoute
                : Routes.tvShowDetailsRoute,
            extra: DetailsParams(
                media: media, listType: "",mediaType:(mediaType == AppStrings.movie || mediaType == "movies")
                ? AppStrings.movie
                : AppStrings.tv)),
        child:CachedNetworkImage(
        imageUrl: EndPoints.backDropsUrl(media.backdropPath),
        imageBuilder: (context, imageProvider) =>_MediaPlayingNowCardBuilder(media: media,image: imageProvider),
        placeholder:(context, url) => const _PlayingNowMediaLoadingCard()));
  }
}
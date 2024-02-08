part of'../screens/search_screen.dart';
class _MediaSearchWidget extends StatelessWidget {
  final Search mediaSearch;
  const _MediaSearchWidget(this.mediaSearch);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
        SearchListCubit.get(context).saveSearch(search: mediaSearch);
        if (mediaSearch.mediaType == AppStrings.movie) {
          Movie m = Movie(
            id: mediaSearch.id,
            name: mediaSearch.name,
            originalName: mediaSearch.originalName,
            posterPath: mediaSearch.posterPath,
            backdropPath: mediaSearch.backdropPath,
          );
          context.pushNamed(Routes.movieDetailsRoute,extra: DetailsParams(media: m, listType: "?", mediaType: AppStrings.movie));
        }
        else if (mediaSearch.mediaType == AppStrings.tv) {
          TvShow tv = TvShow(
            id: mediaSearch.id,
            originalName: mediaSearch.originalName,
            name: mediaSearch.name,
            posterPath: mediaSearch.posterPath,
            backdropPath: mediaSearch.backdropPath,
          );
          context.pushNamed(Routes.tvShowDetailsRoute,extra: DetailsParams(media: tv, listType: "?", mediaType: AppStrings.tv));
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black26,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              width: 120,
              height: 180,
              imageUrl: EndPoints.posterUrl(mediaSearch.posterPath),
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                );
              },
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[850]!,
                highlightColor: Colors.grey[800]!,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            10.pw,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${mediaSearch.originalName != "" ? mediaSearch.originalName : mediaSearch.name} ${mediaSearch.releaseDate == "" ? '' : ((mediaSearch.releaseDate.substring(0, 4)))}",
                    style: AppTextStyles.get14BoldText(),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  7.ph,
                  if (mediaSearch.voteAverage != 0)
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow),
                        5.pw,
                        Text(mediaSearch.voteAverage.toStringAsFixed(1),
                            style: AppTextStyles.get14BoldText())
                      ],
                    ),
                  7.ph,
                  Row(
                    children: [
                      Text(mediaSearch.mediaType==AppStrings.movie?AppStrings.inMovies.tr(context)!:AppStrings.inTv.tr(context)!,
                          style: AppTextStyles.get14BoldText()),
                      5.pw,
                      Icon(
                              mediaSearch.mediaType == AppStrings.movie
                                  ? Icons.movie_filter_rounded
                                  : Icons.tv_rounded,
                              size: 18).addPadding(t: 4)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

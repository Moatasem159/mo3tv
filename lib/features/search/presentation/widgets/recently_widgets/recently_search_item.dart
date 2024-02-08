part of'../../screens/search_screen.dart';
class _RecentlySearchItem extends StatelessWidget {
  final Search search;
  const _RecentlySearchItem(this.search);
  String name(Search search){
    if(search.name!='')
    {
      return "${search.name} ${search.releaseDate == "" ? '' : ((search.releaseDate.substring(0, 4)))}";
    }
    else if(search.originalName!='')
    {
      return "${search.originalName} ${search.releaseDate == "" ? '' : ((search.releaseDate.substring(0, 4)))}";
    }
    return "";
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
        if(search.mediaType=="movie") {
          Movie m=Movie(
            id: search.id,
            name: search.name,
            originalName: search.originalName,
            posterPath: search.posterPath,
            backdropPath: search.backdropPath,
          );
          context.pushNamed(Routes.movieDetailsRoute,extra: DetailsParams(media: m, listType: "?", mediaType: AppStrings.movie));
        }
        else{
          TvShow tv=TvShow(
            id: search.id,
            originalName :search.originalName,
            name: search.name,
            posterPath: search.posterPath,
            backdropPath: search.backdropPath,
          );
          context.pushNamed(Routes.tvShowDetailsRoute,extra: DetailsParams(media: tv, listType: "?", mediaType: AppStrings.tv));
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if(search.mediaType=="tv")
              const Icon(Icons.tv_outlined).addPadding(t:3),
            if(search.mediaType=="movie")
              const Icon(Icons.movie_filter_rounded).addPadding(t: 3),
            10.pw,
            SizedBox(
                width: MediaQuery.of(context).size.width-89,
                child: Text(name(search),maxLines: null,
                  style: AppTextStyles.get14BoldText(),
                  overflow: TextOverflow.ellipsis,)),
            GestureDetector(
              onTap: () => SearchListCubit.get(context).clearOneSearch(search: search),
                child: const Icon(Icons.clear_rounded,size: 15))
          ],
        ),
      ),
    );
  }
}
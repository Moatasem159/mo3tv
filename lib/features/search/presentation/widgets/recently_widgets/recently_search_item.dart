import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/app_routes.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_list_cubit/search_list_cubit.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
class RecentlySearchItem extends StatelessWidget {
  final Search search;
  const RecentlySearchItem({super.key, required this.search});
  String name(Search search){
    if(search.name!='')
    {
      return search.name!;
    }
    else if(search.originalName!='')
    {
      return search.originalName!;
    }
    else if(search.originalTitle!='')
    {
      return search.originalTitle!;
    }
    return "";
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(search.mediaType=="movie") {
          Movie m=Movie(
            id: search.id,
            title: search.originalTitle,
            posterPath: search.posterPath,
            backdropPath: search.backdropPath,
          );
          GoRouter.of(context).pushNamed(Routes.movieDetailsRoute,extra:m);
        }
        else if(search.mediaType=="tv"){
          TvShow tv=TvShow(
            id: search.id,
            originalName :search.originalName,
            name: search.name,
            posterPath: search.posterPath,
            backdropPath: search.backdropPath,
          );
          GoRouter.of(context).pushNamed(Routes.tvShowRoute, extra: tv);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if(search.mediaType=="tv")
              const Icon(Icons.tv_outlined),
            if(search.mediaType=="movie")
              const Icon(Icons.movie_filter_rounded),
            10.pw,
            SizedBox(
                width: MediaQuery.of(context).size.width-89,
                child: Text(name(search),maxLines: null,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,)),
            GestureDetector(
              onTap: () {
                SearchListCubit.get(context).clearOneSearch(search: search);
              },
                child: const Icon(Icons.clear_rounded,size: 15))
          ],
        ),
      ),
    );
  }
}
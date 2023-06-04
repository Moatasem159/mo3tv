import 'package:flutter/material.dart';
import 'package:mo3tv/features/account/domain/entities/account_custom_list_item.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_list_item/movie_list_item.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_list_item.dart';
class AccountCustomListItemsList extends StatelessWidget {
  final List<AccountCustomListItem>? items;
  const AccountCustomListItemsList({super.key, this.items});
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisExtent: 180),
      delegate: SliverChildBuilderDelegate(childCount: items!.length,
            (context, index) {
          if (items![index].mediaType == "movie") {
            Movie m = Movie(
                backdropPath: items![index].backdropPath,
                posterPath: items![index].posterPath,
                originalTitle: items![index].originalTitle,
                title: items![index].title,
                id: items![index].id);
            return MovieListItem(movie: m);
          }
          if (items![index].mediaType == "tv") {
            TvShow t = TvShow(
                backdropPath: items![index].backdropPath,
                posterPath: items![index].posterPath,
                originalName: items![index].originalName,
                name: items![index].title,
                id: items![index].id);
            return TvShowListItem(tvShow: t);
          }
          return Container();
        },
      ),
    );
  }
}
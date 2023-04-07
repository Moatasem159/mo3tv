import 'package:flutter/material.dart';
import 'package:mo3tv/features/search/domain/entities/search.dart';
import 'package:mo3tv/features/search/presentation/widgets/movie_search_widget.dart';
import 'package:mo3tv/features/search/presentation/widgets/tv_show_search_widget.dart';

class SearchList extends StatelessWidget {
  final List<Search> items;
  const SearchList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index){
              if(items[index].mediaType=="movie")
              {
                return MovieSearchWidget(movie: items[index]);
              }
              if(items[index].mediaType=="tv")
              {
                return  TvShowSearchWidget(tvShow:items[index],);
              }
              return Container();
            },),
          const SizedBox(height: 60,)
        ],
      ),
    );
  }
}

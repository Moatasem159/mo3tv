import 'package:flutter/material.dart';
import 'package:mo3tv/core/widgets/list_title.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movie_list_loading_item.dart';
class MoviesLoadingList extends StatelessWidget {
  final String title;
  const MoviesLoadingList({Key? key, required this.title,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTitle(title: title),
        const SizedBox(height:10,),
        SizedBox(
          height: 200,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder:(context, index) {
              return const MovieListLoadingItem();
            }, ),
        ),
        const SizedBox(height:10,),
      ],
    );
  }
}
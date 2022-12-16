import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/movies/presentation/cubit/movie_cubit/movie_cubit.dart';

class GalleryTabBar extends StatelessWidget {
  final int id;
  const GalleryTabBar({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 10,
      backgroundColor: Colors.black,
      automaticallyImplyLeading: false,
      toolbarHeight: 0,
      bottom: PreferredSize(
        preferredSize: const Size(0, 30),
        child: TabBar(
          indicatorWeight: 2,
          indicatorColor: Colors.red,
          labelPadding: const EdgeInsets.only(bottom: 5),
          onTap: (value) {
            BlocProvider.of<MovieCubit>(context).gallery(value,id);
          },
          tabs: const [
            Text("Backdrops"),
            Text("posters"),
            Text("logos"),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mo3tv/features/login/presentation/widgets/login_button.dart';
import 'package:mo3tv/features/movies/presentation/widgets/popular_movies.dart';
import 'package:mo3tv/features/movies/presentation/widgets/top_rated_movies.dart';
import 'package:mo3tv/features/movies/presentation/widgets/movies_appbar_widget.dart';
import 'package:mo3tv/features/movies/presentation/widgets/trending_movies.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: const NeverScrollableScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          const MoviesAppbar(),
        ];
      },
      body: Builder(
          builder: (context) {
            return CustomScrollView(
                slivers: [
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                  ),
                   const LoginButton(),
                  const TrendingMovies(),
                  const PopularMovies(),
                  const TopRatedMovies(),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 15),
                  )
                ]
            );
          }
      ),
    );
  }
}


import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/routes/animations_route/slide_from_down_to_up.dart';
import 'package:mo3tv/core/entities/see_more_parameters.dart';
import 'package:mo3tv/core/widgets/media_see_more/media_see_more.dart';
import 'package:mo3tv/features/account/presentation/screens/account_media_list_screen.dart';
import 'package:mo3tv/features/gallery/presentation/screens/image_screen.dart';
import 'package:mo3tv/features/home/presentation/screens/main_screen.dart';
import 'package:mo3tv/features/login/domain/entities/token.dart';
import 'package:mo3tv/features/login/presentation/screens/login_screen.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/screens/movie_details_screen.dart';
import 'package:mo3tv/features/movies/presentation/screens/similar_movies_screen.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
import 'package:mo3tv/features/tv/presentation/screens/season_details_screen.dart';
import 'package:mo3tv/features/tv/presentation/screens/similar_tv_shows_screen.dart';
import 'package:mo3tv/features/tv/presentation/screens/tv_show_details_screen.dart';
import 'package:mo3tv/features/video/presentation/screens/trailer_screen.dart';
class Routes {
  static const String initialRoute= "/";
  static const String loginRoute= "/loginRoute";
  static const String movieDetailsRoute= "/movieDetailsRoute";
  static const String similarMoviesRoute= "/similarMoviesRoute";
  static const String similarTvShowsRoute= "/similarTvShowsRoute";
  static const String tvShowRoute= "/tvShowRoute";
  static const String seeMoreRoute= "/seeMoreRoute";
  static const String seasonRoute= "/seasonRoute";
  static const String accountMediaLists= "/accountMediaLists";
  static const String imageScreenRoute= "/imageScreenRoute";
  static const String trailerScreenRoute= "/trailerScreenRoute";
}
abstract class AppRoute{
  static final router=GoRouter(
    routes: [
      GoRoute(
        path: Routes.initialRoute,
        name:Routes.initialRoute,
        builder: (context, state) => const MainScreen()),
      GoRoute(
        name: Routes.loginRoute,
        path: Routes.loginRoute,
        builder: (context, state) =>  LoginScreen(token:state.extra as Token)),
      GoRoute(
        name: Routes.movieDetailsRoute,
        path: Routes.movieDetailsRoute,
        pageBuilder: (context, state) =>SlideFromDownToUp(child: MovieDetailsScreen(
            listType: state.queryParameters["listType"]??'',
            movie: state.extra as Movie))),
      GoRoute(
        name: Routes.tvShowRoute,
        path: Routes.tvShowRoute,
       pageBuilder: (context, state) => SlideFromDownToUp(child: TvShowDetailsScreen(
           listType: state.queryParameters["listType"]??'',
           tvShow:  state.extra as TvShow))),
      GoRoute(
        name:  Routes.seeMoreRoute,
        path: Routes.seeMoreRoute,
        builder: (context, state) =>MediaSeeMore(parameters:state.extra as SeeMoreParameters)),
      GoRoute(
        name:  Routes.seasonRoute,
        path: Routes.seasonRoute,
        builder: (context, state) =>  SeasonDetailsScreen(
            season:state.extra as TvShowSeason,
            tvShowName:state.queryParameters["tvShowName"]!,
            tvShowId:int.parse(state.queryParameters["tvShowId"]!))),
      GoRoute(
        name:  Routes.similarMoviesRoute,
        path: Routes.similarMoviesRoute,
        builder: (context, state) =>  SimilarMoviesScreen(
          recommendations: state.extra as List<Movie>,
          movieId:int.parse(state.queryParameters["movieId"]!))),
      GoRoute(
        name:  Routes.similarTvShowsRoute,
        path: Routes.similarTvShowsRoute,
        builder: (context, state) =>  SimilarTvShowsScreen(
          recommendations: state.extra as List<TvShow>,
          tvId:int.parse(state.queryParameters["tvId"]!))),
      GoRoute(
        name:  Routes.accountMediaLists,
        path: Routes.accountMediaLists,
        builder: (context, state) =>  AccountMediaListsScreen(
          title: state.queryParameters["title"]!,
          listType: state.queryParameters['listType']!,
          mediaType: state.queryParameters["mediaType"]!,
        )),
      GoRoute(
        name:  Routes.imageScreenRoute,
        path: Routes.imageScreenRoute,
        builder: (context, state) =>  ImageScreen(image: state.queryParameters["image"]!)),
      GoRoute(
        name:  Routes.trailerScreenRoute,
        path: Routes.trailerScreenRoute,
        builder: (context, state) =>  TrailerScreen(
          title:state.queryParameters["title"]!,
          url:state.queryParameters["url"]!)),
    ],
  );
}
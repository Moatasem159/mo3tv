import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/config/routes/animations_route/scale_from_center.dart';
import 'package:mo3tv/config/routes/animations_route/slide_from_down_to_up.dart';
import 'package:mo3tv/config/routes/animations_route/slide_from_left_to_right.dart';
import 'package:mo3tv/config/routes/animations_route/slide_from_right_to_left.dart';
import 'package:mo3tv/core/entities/see_more_parameters.dart';
import 'package:mo3tv/core/widgets/media_see_more/media_see_more.dart';
import 'package:mo3tv/core/widgets/media_web_home_page/media_web_page_screen.dart';
import 'package:mo3tv/features/account/presentation/screens/account_media_list_screen.dart';
import 'package:mo3tv/features/connectivity/presentation/screens/no_connection_screen.dart';
import 'package:mo3tv/features/gallery/presentation/screens/image_screen.dart';
import 'package:mo3tv/features/home/presentation/screens/main_screen.dart';
import 'package:mo3tv/features/auth/domain/entities/token.dart';
import 'package:mo3tv/features/auth/presentation/screens/login_screen.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/screens/movie_details_screen.dart';
import 'package:mo3tv/features/movies/presentation/screens/similar_movies_screen.dart';
import 'package:mo3tv/features/settings/presentation/screens/language_screen.dart';
import 'package:mo3tv/features/settings/presentation/screens/settings_screen.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show_season.dart';
import 'package:mo3tv/features/tv/presentation/screens/season_details_screen.dart';
import 'package:mo3tv/features/tv/presentation/screens/similar_tv_shows_screen.dart';
import 'package:mo3tv/features/tv/presentation/screens/tv_show_details_screen.dart';
import 'package:mo3tv/features/video/presentation/screens/trailer_screen.dart';
abstract class Routes {
  static const String initialRoute= "/";
  static const String loginRoute= "/loginRoute";
  static const String noConnectionRoute= "/noConnectionRoute";
  static const String movieDetailsRoute= "/movieDetailsRoute/:listType";
  static const String similarMoviesRoute= "/similarMoviesRoute/:movieId";
  static const String similarTvShowsRoute= "/similarTvShowsRoute/:tvId";
  static const String tvShowDetailsRoute= "/tvShowDetailsRoute/:listType";
  static const String seeMoreRoute= "/seeMoreRoute";
  static const String seasonRoute= "/seasonRoute/:tvShowName/:tvShowId";
  static const String accountMediaLists= "/accountMediaLists/:title/:listType/:mediaType";
  static const String imageScreenRoute= "/imageScreenRoute/:image";
  static const String trailerScreenRoute= "/trailerScreenRoute/:title/:url";
  static const String settingsRoute = "/settingsRoute";
  static const String languageRoute = "/languageRoute";
  static const String mediaWebPageRoute = "/mediaWebPageRoute/:link";
}
abstract class AppRoute{
  static final GoRouter router=GoRouter(
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
        name: Routes.noConnectionRoute,
        path: Routes.noConnectionRoute,
        builder: (context, state) =>  const NoConnectionScreen()),
      GoRoute(
        name: Routes.movieDetailsRoute,
        path: Routes.movieDetailsRoute,
        pageBuilder: (context, state) =>SlideFromDownToUp(child: MovieDetailsScreen(
            listType: state.pathParameters["listType"]!,
            movie: state.extra as Movie))),
      GoRoute(
        name: Routes.tvShowDetailsRoute,
        path: Routes.tvShowDetailsRoute,
       pageBuilder: (context, state) => SlideFromDownToUp(child: TvShowDetailsScreen(
           listType: state.pathParameters["listType"]??'',
           tvShow:  state.extra as TvShow))),
      GoRoute(
        name: Routes.mediaWebPageRoute,
        path: Routes.mediaWebPageRoute,
        pageBuilder: (context, state) =>SlideFromDownToUp(child:MediaWebScreen(link: state.pathParameters["link"]!) ),
      ),
      GoRoute(
        name:  Routes.seeMoreRoute,
        path: Routes.seeMoreRoute,
        pageBuilder: (context, state) =>
        AppLocalizations.of(context)!.isEnLocale?
            SlideFromRightToLeft(child: MediaSeeMore(parameters:state.extra as SeeMoreParameters)):
        SlideFromLeftToRight(child: MediaSeeMore(parameters:state.extra as SeeMoreParameters))),
      GoRoute(
        name:  Routes.seasonRoute,
        path: Routes.seasonRoute,
        builder: (context, state) =>  SeasonDetailsScreen(
            season:state.extra as TvShowSeason,
            tvShowName:state.pathParameters["tvShowName"]!,
            tvShowId:int.parse(state.pathParameters["tvShowId"]!))),
      GoRoute(
        name:  Routes.similarMoviesRoute,
        path: Routes.similarMoviesRoute,
        pageBuilder: (context, state) =>
        AppLocalizations.of(context)!.isEnLocale?
            SlideFromRightToLeft(child: SimilarMoviesScreen(
            recommendations: state.extra as List<Movie>,
            movieId:int.parse(state.pathParameters["movieId"]!))):
        SlideFromLeftToRight(child: SimilarMoviesScreen(
            recommendations: state.extra as List<Movie>,
            movieId:int.parse(state.pathParameters["movieId"]!)))),
      GoRoute(
        name:  Routes.similarTvShowsRoute,
        path: Routes.similarTvShowsRoute,
        pageBuilder: (context, state) =>
        AppLocalizations.of(context)!.isEnLocale?
            SlideFromRightToLeft(child: SimilarTvShowsScreen(
            recommendations: state.extra as List<TvShow>,
            tvId:int.parse(state.pathParameters["tvId"]!))):
        SlideFromLeftToRight(child: SimilarTvShowsScreen(
            recommendations: state.extra as List<TvShow>,
            tvId:int.parse(state.pathParameters["tvId"]!)))),
      GoRoute(
        name:  Routes.accountMediaLists,
        path: Routes.accountMediaLists,
        pageBuilder: (context, state) =>
        AppLocalizations.of(context)!.isEnLocale?
            SlideFromLeftToRight(child: AccountMediaListsScreen(
          title: state.pathParameters["title"]!,
          listType: state.pathParameters['listType']!,
          mediaType: state.pathParameters["mediaType"]!,
        )):
        SlideFromRightToLeft(child: AccountMediaListsScreen(
          title: state.pathParameters["title"]!,
          listType: state.pathParameters['listType']!,
          mediaType: state.pathParameters["mediaType"]!,
        ))),
      GoRoute(
        name:  Routes.imageScreenRoute,
        path: Routes.imageScreenRoute,
        builder: (context, state) =>  ImageScreen(image: state.pathParameters["image"]!)),
      GoRoute(
        name:  Routes.trailerScreenRoute,
        path: Routes.trailerScreenRoute,
        pageBuilder: (context, state) => ScaleFromCenter(child: TrailerScreen(
            title:state.pathParameters["title"]!,
            url:state.pathParameters["url"]!)),),
      GoRoute(
        name: Routes.settingsRoute,
        path: Routes.settingsRoute,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        name: Routes.languageRoute,
        path: Routes.languageRoute,
        builder: (context, state) => const LanguageScreen(),
      ),
    ],
  );
}
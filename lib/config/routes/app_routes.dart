import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/features/auth/presentation/cubits/log_cubit/log_cubit.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/features/media/domain/entities/tv_show_season.dart';
import 'package:mo3tv/features/home/presentation/screens/main_screen.dart';
import 'package:mo3tv/features/auth/presentation/screens/login_screen.dart';
import 'package:mo3tv/config/routes/animations_route/scale_from_center.dart';
import 'package:mo3tv/features/media/presentation/screens/media_screen.dart';
import 'package:mo3tv/features/gallery/presentation/screens/image_screen.dart';
import 'package:mo3tv/features/on_boarding/presentation/screens/genres_screen.dart';
import 'package:mo3tv/features/on_boarding/presentation/screens/on_boarding_screen.dart';
import 'package:mo3tv/features/search/presentation/screens/search_screen.dart';
import 'package:mo3tv/features/media/presentation/screens/trailer_screen.dart';
import 'package:mo3tv/config/routes/animations_route/slide_from_down_to_up.dart';
import 'package:mo3tv/features/account/presentation/screens/account_screen.dart';
import 'package:mo3tv/core/widgets/media_web_home_page/media_web_page_screen.dart';
import 'package:mo3tv/features/settings/presentation/screens/language_screen.dart';
import 'package:mo3tv/features/settings/presentation/screens/settings_screen.dart';
import 'package:mo3tv/config/routes/animations_route/slide_from_left_to_right.dart';
import 'package:mo3tv/config/routes/animations_route/slide_from_right_to_left.dart';
import 'package:mo3tv/features/media/presentation/screens/media_details_screen.dart';
import 'package:mo3tv/features/media/presentation/screens/see_more_media_screen.dart';
import 'package:mo3tv/features/media/presentation/screens/season_details_screen.dart';
import 'package:mo3tv/features/account/presentation/screens/account_media_list_screen.dart';
import 'package:mo3tv/features/connectivity/presentation/screens/no_connection_screen.dart';
import 'package:mo3tv/features/account/presentation/cubit/account_lists_cubit/account_lists_cubit.dart';
abstract class Routes {
  static const String initialRoute = "/movieRoute";
  static const String onBoardingRoute = "onBoardingRoute";
  static const String genresRoute = "genresRoute";
  static const String movieRoute = "movieRoute";
  static const String seeMoreMoviesRoute = "seeMoreMovieRoute";
  static const String tvRoute = "tvRoute";
  static const String seeMoreTvShowsRoute = "seeMoreTvShowRoute";
  static const String searchRoute = "searchRoute";
  static const String accountRoute = "accountRoute";
  static const String accountMediaLists = "accountMediaLists";
  static const String settingsRoute = "settingsRoute";
  static const String languageRoute = "languageRoute";
  static const String movieDetailsRoute = "movieDetailsRoute";
  static const String tvShowDetailsRoute = "tvShowDetailsRoute";
  static const String similarMoviesRoute = "similarMoviesRoute";
  static const String similarTvShowRoute = "similarTvShowRoute";
  static const String seasonRoute = "seasonRoute";
  static const String trailerMovieScreenRoute = "trailerMovieScreenRoute";
  static const String trailerTvShowScreenRoute = "trailerTvShowScreenRoute";
  static const String movieWebPageRoute = "movieWebPageRoute";
  static const String tvShowWebPageRoute = "tvShowWebPageRoute";
  static const String movieImageScreenRoute = "movieImageScreenRoute";
  static const String tvShowImageScreenRoute = "tvShowImageScreenRoute";
  static const String loginRoute = "loginRoute";
  static const String noConnectionRoute = "noConnectionRoute";
}
abstract class AppRoute {
  static final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
    navigatorKey: navigationKey,
    initialLocation: "/genresRoute",
    routes: [
      GoRoute(
          path: "/onBoardingRoute",
          name: Routes.onBoardingRoute,
          parentNavigatorKey: navigationKey,
          redirect: (context, state) {
            if(AppStrings.sessionId!='')
            {
              return Routes.initialRoute;
            }
            else{
              return "/onBoardingRoute";
            }
          },
          builder: (context, state) => const OnBoardingScreen()),
      GoRoute(
          path: "/genresRoute",
          name: Routes.genresRoute,
          parentNavigatorKey: navigationKey,
        pageBuilder: (context, state) => AppLocalizations.of(context)!.isEnLocale ?
        SlideFromRightToLeft(child: const GenresScreen()) :
        SlideFromLeftToRight(child: const GenresScreen()),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context,state , navigationShell) => MainScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            initialLocation: "/movieRoute",
            routes: [
              GoRoute(
                  path: "/movieRoute",
                  name: Routes.movieRoute,
                  builder: (context, state) => const MediaScreen(mediaType: AppStrings.movie),
                  routes: [
                    _movieDetailsRouter
                  ]
              ),
              GoRoute(
                  path: "/seeMoreMoviesRoute/:params",
                  name: Routes.seeMoreMoviesRoute,
                  pageBuilder: _seeMoreMediaSubRoute)
            ],
          ),
          StatefulShellBranch(
            initialLocation: "/tvRoute",
            routes: [
              GoRoute(
                  path: "/tvRoute",
                  name: Routes.tvRoute,
                  builder: (context, state) =>
                  const MediaScreen(mediaType: AppStrings.tv),
                  routes: [
                    _tvDetailsRouter
                  ]
              ),
              GoRoute(
                  path: "/seeMoreTvShowRoute/:params",
                  name: Routes.seeMoreTvShowsRoute,
                  pageBuilder: _seeMoreMediaSubRoute)
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: "/searchRoute",
                  name: Routes.searchRoute,
                  builder: (context, state) => const SearchScreen())
            ],
          ),
          StatefulShellBranch(
            initialLocation: "/accountRoute",
            routes: [
              GoRoute(
                path: "/accountRoute",
                name: Routes.accountRoute,
                builder: (context, state) => AccountScreen(
                  key: state.pageKey
                ),
                routes: [
                  GoRoute(
                    path: "accountMediaLists/:title/:listType/:mediaType",
                    parentNavigatorKey: navigationKey,
                    name: Routes.accountMediaLists,
                    pageBuilder: (context, state) =>
                    AppLocalizations.of(context)!.isEnLocale ?
                    SlideFromLeftToRight(child: AccountMediaListsScreen(
                      title: state.pathParameters["title"]!,
                      listType: state.pathParameters['listType']!,
                      mediaType: state.pathParameters["mediaType"]!,
                    )) :
                    SlideFromRightToLeft(child: AccountMediaListsScreen(
                      title: state.pathParameters["title"]!,
                      listType: state.pathParameters['listType']!,
                      mediaType: state.pathParameters["mediaType"]!,
                    )),
                  ),
                ]
              ),
            ],
          ),
          StatefulShellBranch(
            initialLocation: "/settingsRoute",
            routes: [
              GoRoute(
                  path: "/settingsRoute",
                  name: Routes.settingsRoute,
                  builder: (context, state) => const SettingsScreen(),
                  routes: [
                    GoRoute(
                      parentNavigatorKey: navigationKey,
                      path: "languageRoute",
                      name: Routes.languageRoute,
                      pageBuilder: (context, state) =>
                      const NoTransitionPage(child: LanguageScreen()),
                    ),
                  ]
              ),
            ],
          ),
        ],
      ),
      GoRoute(
          path: "/loginRoute/:token",
          name: Routes.loginRoute,
          parentNavigatorKey: navigationKey,
          builder: (context, state) => BlocProvider.value(
                value: state.extra as LogCubit,
                child: LoginScreen(token: state.pathParameters["token"]!),
              )),
      GoRoute(
          path:"/noConnectionRoute",
          name: Routes.noConnectionRoute,
          parentNavigatorKey: navigationKey,
          builder: (context, state) => const NoConnectionScreen()),
    ],
  );
  static final GoRoute _movieDetailsRouter = GoRoute(
      parentNavigatorKey: navigationKey,
      path: "movieDetailsRoute",
      name: Routes.movieDetailsRoute,
      pageBuilder: _mediaDetailsSubRoute,
      routes: [
        GoRoute(
            parentNavigatorKey: navigationKey,
            path: "trailerMoviesScreenRoute/:title/:url",
            name: Routes.trailerMovieScreenRoute,
            pageBuilder: _mediaTrailerSubRoute),
        GoRoute(
          parentNavigatorKey: navigationKey,
          path: "movieWebPageRoute/:link",
          name: Routes.movieWebPageRoute,
          pageBuilder: _mediaWebPageSubRoute,
        ),
        GoRoute(
            parentNavigatorKey: navigationKey,
            path: "similarMoviesRoute/:params",
            name: Routes.similarMoviesRoute,
            pageBuilder: _seeMoreMediaSubRoute),
        GoRoute(
            parentNavigatorKey: navigationKey,
            path: "movieImagesScreenRoute/:image",
            name: Routes.movieImageScreenRoute,
            builder: _imageScreenSubRoute),
      ]
  );
  static final GoRoute _tvDetailsRouter = GoRoute(
      parentNavigatorKey: navigationKey,
      path: "tvShowDetailsRoute",
      name: Routes.tvShowDetailsRoute,
      pageBuilder: _mediaDetailsSubRoute,
      routes: [
        GoRoute(
            parentNavigatorKey: navigationKey,
            path: "trailerTvShowScreenRoute/:title/:url",
            name: Routes.trailerTvShowScreenRoute,
            pageBuilder: _mediaTrailerSubRoute),
        GoRoute(
          parentNavigatorKey: navigationKey,
          path: "tvShowWebPageRoute/:link",
          name: Routes.tvShowWebPageRoute,
          pageBuilder: _mediaWebPageSubRoute,
        ),
        GoRoute(
            parentNavigatorKey: navigationKey,
            path: "similarTvShowRoute/:params",
            name: Routes.similarTvShowRoute,
            pageBuilder: _seeMoreMediaSubRoute
        ),
        GoRoute(
            parentNavigatorKey: navigationKey,
            path: "tvShowImagesScreenRoute/:image",
            name: Routes.tvShowImageScreenRoute,
            builder: _imageScreenSubRoute),
        GoRoute(
            parentNavigatorKey: navigationKey,
            path: ":tvShowName/:tvShowId",
            name: Routes.seasonRoute,
            builder: (context, state) =>
                SeasonDetailsScreen(
                    season: state.extra as TvShowSeason,
                    tvShowName: state.pathParameters["tvShowName"]!,
                    tvShowId: int.parse(state.pathParameters["tvShowId"]!))),
      ]
  );
  static Page<dynamic> _seeMoreMediaSubRoute(context, state) {
    return AppLocalizations.of(context)!.isEnLocale ?
    SlideFromRightToLeft(child: SeeMoreMediaScreen(
      media: state.extra as List<Media>,
      params: MediaParams.fromJson(state.pathParameters["params"]!),
    )) :
    SlideFromLeftToRight(child: SeeMoreMediaScreen(
      media: state.extra as List<Media>,
      params: MediaParams.fromJson(state.pathParameters["params"]!),
    ));
  }
  static Page<dynamic> _mediaDetailsSubRoute(context, state) {
    DetailsParams params = state.extra as DetailsParams;
    if (params.cubit == null) {
      return SlideFromDownToUp(child:MediaDetailsScreen(media: params));
    }
    else {
      return SlideFromDownToUp(child: BlocProvider.value(
        value: params.cubit as AccountListsCubit,
        child: MediaDetailsScreen(media: params)));
    }
  }
  static Page<dynamic> _mediaTrailerSubRoute(context, state) {
    return ScaleFromCenter(child: TrailerScreen(
        title: state.pathParameters["title"]!,
        url: state.pathParameters["url"]!));
  }
  static Page<dynamic> _mediaWebPageSubRoute(context, state) {
    return SlideFromDownToUp(
        child: MediaWebScreen(link: state.pathParameters["link"]!));
  }
  static Widget _imageScreenSubRoute(context, state) {
    return ImageScreen(image: state.pathParameters["image"]!);
  }
}
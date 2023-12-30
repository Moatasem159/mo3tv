import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/config/routes/animations_route/scale_from_center.dart';
import 'package:mo3tv/config/routes/animations_route/slide_from_down_to_up.dart';
import 'package:mo3tv/config/routes/animations_route/slide_from_left_to_right.dart';
import 'package:mo3tv/config/routes/animations_route/slide_from_right_to_left.dart';
import 'package:mo3tv/features/media/domain/entities/media.dart';
import 'package:mo3tv/features/media/domain/entities/media_params.dart';
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/features/media/presentation/screens/media_details_screen.dart';
import 'package:mo3tv/features/media/presentation/screens/see_more_media_screen.dart';
import 'package:mo3tv/core/widgets/media_web_home_page/media_web_page_screen.dart';
import 'package:mo3tv/features/account/presentation/screens/account_media_list_screen.dart';
import 'package:mo3tv/features/account/presentation/screens/account_screen.dart';
import 'package:mo3tv/features/connectivity/presentation/screens/no_connection_screen.dart';
import 'package:mo3tv/features/gallery/presentation/screens/image_screen.dart';
import 'package:mo3tv/features/home/presentation/screens/main_screen.dart';
import 'package:mo3tv/features/auth/domain/entities/token.dart';
import 'package:mo3tv/features/auth/presentation/screens/login_screen.dart';
import 'package:mo3tv/features/media/presentation/screens/media_screen.dart';
import 'package:mo3tv/features/search/presentation/screens/search_screen.dart';
import 'package:mo3tv/features/settings/presentation/screens/language_screen.dart';
import 'package:mo3tv/features/settings/presentation/screens/settings_screen.dart';
import 'package:mo3tv/features/media/domain/entities/tv_show_season.dart';
import 'package:mo3tv/features/media/presentation/screens/season_details_screen.dart';
import 'package:mo3tv/features/video/presentation/screens/trailer_screen.dart';
abstract class Routes {
  static const String movieRoute = "/";
  static const String tvRoute = "/tvRoute";
  static const String searchRoute = "/searchRoute";
  static const String accountRoute = "/accountRoute";
  static const String settingsRoute = "/settingsRoute";
  static const String loginRoute = "/loginRoute";
  static const String noConnectionRoute = "/noConnectionRoute";
  static const String movieDetailsRoute = "/movieDetailsRoute/:listType";
  static const String similarMediaRoute = "/similarMoviesRoute/:params";
  static const String seeMoreMediaRoute = "/seeMoreMediaRoute/:params";
  static const String tvShowDetailsRoute = "/tvShowDetailsRoute/:listType";
  static const String seasonRoute = "/seasonRoute/:tvShowName/:tvShowId";
  static const String accountMediaLists = "/accountMediaLists/:title/:listType/:mediaType";
  static const String imageScreenRoute = "/imageScreenRoute/:image";
  static const String trailerScreenRoute = "/trailerScreenRoute/:title/:url";
  static const String languageRoute = "/languageRoute";
  static const String mediaWebPageRoute = "/mediaWebPageRoute/:link";
}
abstract class AppRoute {
  static final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
    navigatorKey: navigationKey,
    initialLocation: Routes.movieRoute,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context,
            state,
            navigationShell,) => MainScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            initialLocation: Routes.movieRoute,
            routes: [
              GoRoute(
                path: Routes.movieRoute,
                name: Routes.movieRoute,
                builder: (context, state) =>
                const MediaScreen(mediaType: AppStrings.movie),
              ),
              GoRoute(
                  name: Routes.seeMoreMediaRoute,
                  path: Routes.seeMoreMediaRoute,
                  pageBuilder: (context, state) =>
                  AppLocalizations.of(context)!.isEnLocale ?
                  SlideFromRightToLeft(child: SeeMoreMediaScreen(
                    media: state.extra as List<Media>,
                    params: MediaParams.fromJson(state.pathParameters["params"]!),
                    // mediaId:int.parse(state.uri.queryParameters["mediaId"]??"8549565264541"),
                    // moreType:state.uri.queryParameters["moreType"]??'',
                    // mediaType: state.uri.queryParameters["mediaType"]??'',
                    // listTitle: state.uri.queryParameters["listTitle"]??'',
                    // listType: state.uri.queryParameters["listType"]??'',
                  )):
                  SlideFromLeftToRight(child: SeeMoreMediaScreen(
                    media: state.extra as List<Media>,
                    params: MediaParams.fromJson(state.pathParameters["params"]!),
                    // mediaId:int.parse(state.uri.queryParameters["mediaId"]??"8549565264541"),
                    // moreType: state.pathParameters["moreType"]??'',
                    // mediaType: state.pathParameters["mediaType"]??'',
                    // listTitle: state.pathParameters["listTitle"]??'',
                    // listType: state.pathParameters["listType"]??'',
                  ))),
            ],
          ),
          StatefulShellBranch(
            initialLocation: Routes.tvRoute,
            routes: [
              GoRoute(
                path: Routes.tvRoute,
                name: Routes.tvRoute,
                builder: (context, state) =>
                const MediaScreen(mediaType: AppStrings.tv),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.searchRoute,
                name: Routes.searchRoute,
                builder: (context, state) => const SearchScreen(),
              )
            ],
          ),
          StatefulShellBranch(
            initialLocation: Routes.accountRoute,
            routes: [
              GoRoute(
                path: Routes.accountRoute,
                name: Routes.accountRoute,
                builder: (context, state) => const AccountScreen(),
              ),
              GoRoute(
                  name: Routes.accountMediaLists,
                  path: Routes.accountMediaLists,
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
                  ))),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: Routes.settingsRoute,
                path: Routes.settingsRoute,
                builder: (context, state) => const SettingsScreen(),
              ),
              GoRoute(
                name: Routes.languageRoute,
                path: Routes.languageRoute,
                pageBuilder: (context, state) =>
                const NoTransitionPage(child: LanguageScreen()),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
          parentNavigatorKey: navigationKey,
          name: Routes.similarMediaRoute,
          path: Routes.similarMediaRoute,
          pageBuilder: (context, state) =>
          AppLocalizations.of(context)!.isEnLocale ?
          SlideFromRightToLeft(child: SeeMoreMediaScreen(
            media: state.extra as List<Media>,
            params: MediaParams.fromJson(state.pathParameters["params"]!))):
          SlideFromLeftToRight(child: SeeMoreMediaScreen(
            media: state.extra as List<Media>,
            params: MediaParams.fromJson(state.pathParameters["params"]!)))),
      GoRoute(
          parentNavigatorKey: navigationKey,
          name: Routes.loginRoute,
          path: Routes.loginRoute,
          builder: (context, state) =>
              LoginScreen(token: state.extra as Token)),
      GoRoute(
          parentNavigatorKey: navigationKey,
          name: Routes.noConnectionRoute,
          path: Routes.noConnectionRoute,
          builder: (context, state) => const NoConnectionScreen()),
      GoRoute(
          parentNavigatorKey: navigationKey,
          name: Routes.movieDetailsRoute,
          path: Routes.movieDetailsRoute,
          pageBuilder: (context, state) =>
              SlideFromDownToUp(child: MediaDetailsScreen(
                  mediaType: AppStrings.movie,
                  listType: state.pathParameters["listType"]!,
                  media: state.extra as Media))),
      GoRoute(
          parentNavigatorKey: navigationKey,
          name: Routes.tvShowDetailsRoute,
          path: Routes.tvShowDetailsRoute,
          pageBuilder: (context, state) =>
              SlideFromDownToUp(child: MediaDetailsScreen(
                mediaType: AppStrings.tv,
                  listType: state.pathParameters["listType"] ?? '',
                  media: state.extra as Media))),
      GoRoute(
        parentNavigatorKey: navigationKey,
        name: Routes.mediaWebPageRoute,
        path: Routes.mediaWebPageRoute,
        pageBuilder: (context, state) => SlideFromDownToUp(
            child: MediaWebScreen(link: state.pathParameters["link"]!)),
      ),
      GoRoute(
          parentNavigatorKey: navigationKey,
          name: Routes.seasonRoute,
          path: Routes.seasonRoute,
          builder: (context, state) =>
              SeasonDetailsScreen(
                  season: state.extra as TvShowSeason,
                  tvShowName: state.pathParameters["tvShowName"]!,
                  tvShowId: int.parse(state.pathParameters["tvShowId"]!))),
      GoRoute(
          parentNavigatorKey: navigationKey,
          name: Routes.imageScreenRoute,
          path: Routes.imageScreenRoute,
          builder: (context, state) =>
              ImageScreen(image: state.pathParameters["image"]!)),
      GoRoute(
        parentNavigatorKey: navigationKey,
        name: Routes.trailerScreenRoute,
        path: Routes.trailerScreenRoute,
        pageBuilder: (context, state) =>
            ScaleFromCenter(child: TrailerScreen(
                title: state.pathParameters["title"]!,
                url: state.pathParameters["url"]!)),),
    ],
  );
}
import 'package:go_router/go_router.dart';
import 'package:mo3tv/core/entities/see_more_parameters.dart';
import 'package:mo3tv/core/widgets/media_see_more/media_see_more.dart';
import 'package:mo3tv/features/home/presentation/screens/main_screen.dart';
import 'package:mo3tv/features/login/domain/entities/token.dart';
import 'package:mo3tv/features/login/presentation/screens/login_screen.dart';
import 'package:mo3tv/features/movies/domain/entities/movie.dart';
import 'package:mo3tv/features/movies/presentation/screens/movie_details_screen.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/screens/tv_show_details_screen.dart';
class Routes {
  static const String initialRoute= "/";
  static const String loginRoute= "/loginRoute";
  static const String movieRoute= "/movieRoute";
  static const String tvShowRoute= "/tvShowRoute";
  static const String seeMoreRoute= "/seeMoreRoute";
}



abstract class AppRoute{
  static final router=GoRouter(
    routes: [
      GoRoute(
        path: Routes.initialRoute,
        name:Routes.initialRoute,
        builder: (context, state) => const MainScreen(),
        
      ),
      GoRoute(
        name: Routes.loginRoute,
        path: Routes.loginRoute,
        builder: (context, state) =>  LoginScreen(token:state.extra as Token)
        
      ),
      GoRoute(
        name: Routes.movieRoute,
        path: Routes.movieRoute,
        builder: (context, state) =>  MovieDetailsScreen(
          movie: state.extra as Movie,
        ),

      ),
      GoRoute(
        name: Routes.tvShowRoute,
        path: Routes.tvShowRoute,
        builder: (context, state) =>  TvShowDetailsScreen(
            tvShow:  state.extra as TvShow,
        ),

      ),
      GoRoute(
        name:  Routes.seeMoreRoute,
        path: Routes.seeMoreRoute,
        builder: (context, state) =>  MediaSeeMore(parameters:state.extra as SeeMoreParameters),
        ),
    ],
  );
}
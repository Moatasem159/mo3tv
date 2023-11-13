import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
import 'package:mo3tv/core/utils/app_strings.dart';
import 'package:mo3tv/core/widgets/media_details_appbar.dart';
import 'package:mo3tv/features/credits/presentation/cubits/credits_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_cubit/gallery_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_navigator_cubit/gallery_navigator_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/gallery_tab_bar.dart';
import 'package:mo3tv/features/reviews/presentation/cubits/reviews_cubit.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/recommendations_tv_cubit/recommendations_tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_bottomnav_cubit/tv_show_bottom_nav_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_bottomnav_cubit/tv_show_bottom_nav_state.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_buttons_bloc/tv_actions_bloc.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_bottom_nav_bar/tv_show_bottom_nav_bar.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_details_screen_body.dart';
class TvShowDetailsScreen extends StatelessWidget {
  final TvShow tvShow;
  final String listType;
  const TvShowDetailsScreen({super.key, required this.tvShow, this.listType = '?'});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GalleryNavigatorCubit()),
        BlocProvider(create: (context) => TvShowBottomNavCubit()..tvShow = tvShow..listType=listType..initScreens()),
        BlocProvider(create: (context) => TvCubit(di.sl())..getTvShowDetailsData(tvShowId: tvShow.id)),
        BlocProvider(create: (context) => TvActionsBloc(di.sl(),di.sl(),di.sl())),
        BlocProvider(create: (context) => GalleryCubit(di.sl())..mediaId=tvShow.id..mediaType=AppStrings.tv..getMediaGallery()),
        BlocProvider(create: (context) => ReviewsCubit(di.sl())..mediaId=tvShow.id..mediaType=AppStrings.tv..getMediaReviews()),
        BlocProvider(create: (context) => CreditsCubit(di.sl())..mediaId=tvShow.id..mediaType=AppStrings.tv..getMediaCredits()),
        BlocProvider(create: (context) => RecommendationsTvCubit(di.sl())..getTvShowsRecommendations(tvId: tvShow.id)),
      ],
      child: Builder(builder: (context) {
        return BlocBuilder<TvShowBottomNavCubit, TvShowBottomNavStates>(
          builder: (context, state) {
            TvShowBottomNavCubit cubit = TvShowBottomNavCubit.get(context);
            return WillPopScope(
              onWillPop: () async {
                if (cubit.index != 0) {
                  cubit.changeScreen(0);
                  return false;
                }
                else {
                  return true;
                }
              },
              child: DefaultTabController(
                length: 3,
                child: SafeArea(
                  child: Scaffold(
                    backgroundColor: Theme.of(context).colorScheme.background,
                    bottomNavigationBar: const TvShowBottomNavbar(),
                    body: NestedScrollView(
                      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
                      controller: TvShowBottomNavCubit.get(context).nestedController,
                      headerSliverBuilder: (context, innerBoxIsScrolled) => [
                        SliverOverlapAbsorber(
                          handle: cubit.appBar,
                          sliver: SliverPersistentHeader(
                            pinned: true,
                            delegate: MediaDetailsAppBar(
                              isMovie: false,
                              media: tvShow,
                              onTap: TvShowBottomNavCubit.get(context).resetList,
                              onBackTap: () {
                                if (TvShowBottomNavCubit.get(context).index != 0) {
                                  TvShowBottomNavCubit.get(context).changeScreen(0);
                                } else {
                                  GoRouter.of(context).pop();
                                }
                              },
                            ),
                          ),
                        ),
                        if (cubit.isGallery)
                        SliverOverlapAbsorber(handle: cubit.disconnectBar, sliver: const GalleryTabBar())
                        ],
                      body:const TvShowDetailsScreenBody(),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
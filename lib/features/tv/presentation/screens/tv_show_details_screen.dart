import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/app/injection_container.dart' as di;
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/credits/presentation/cubits/credits_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_navigator_cubit/gallery_navigator_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/gallery_tab_bar.dart';
import 'package:mo3tv/features/reviews/presentation/cubits/reviews_cubit.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/recommendations_tv_cubit/recommendations_tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_bottomnav_cubit/tv_show_bottom_nav_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_bottomnav_cubit/tv_show_bottom_nav_state.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_buttons_bloc/tv_actions_bloc.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_appbar_widget.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_bottom_nav_bar/tv_show_bottom_nav_bar.dart';
class TvShowDetailsScreen extends StatelessWidget {
  final TvShow tvShow;
  final String listType;
  const TvShowDetailsScreen({Key? key, required this.tvShow, this.listType = '?'}):super(key: key);
  @override
  Widget build(BuildContext context) {
    final SliverOverlapAbsorberHandle appBar = SliverOverlapAbsorberHandle();
    final SliverOverlapAbsorberHandle disconnectBar = SliverOverlapAbsorberHandle();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TvShowBottomNavCubit()..tvShow = tvShow..listType=listType..initScreens()),
        BlocProvider(create: (context) => GalleryNavigatorCubit()),
        BlocProvider(create: (context) => TvCubit(di.sl())),
        BlocProvider(create: (context) => TvActionsBloc(di.sl(),di.sl(),di.sl())),
        BlocProvider(create: (context) => RecommendationsTvCubit(di.sl())),
        BlocProvider(create: (context) => GalleryCubit(di.sl())),
        BlocProvider(create: (context) => ReviewsCubit(di.sl())),
        BlocProvider(create: (context) => CreditsCubit(di.sl())),
      ],
      child: Builder(builder: (context) {
        if (!TvCubit.get(context).isSuccess()) {
          TvCubit.get(context).getTvShowDetailsData(tvShowId: tvShow.id!, lang: AppLocalizations.of(context)!.getLang());
        }
        return BlocBuilder<TvShowBottomNavCubit, TvShowBottomNavStates>(
          builder: (context, state) {
            TvShowBottomNavCubit cubit = TvShowBottomNavCubit.get(context);
            return WillPopScope(
              onWillPop: () async {
                if (cubit.index != 0) {
                  cubit.changeScreen(0, context);
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
                      controller: TvShowBottomNavCubit.get(context).nestedController,
                      headerSliverBuilder: (context, innerBoxIsScrolled) {
                        return [
                          SliverOverlapAbsorber(
                            handle: appBar,
                            sliver: SliverPersistentHeader(pinned: true, delegate: TvShowDetailsAppBar(tvShow))),
                          if (cubit.isGallery)
                            SliverOverlapAbsorber(handle: disconnectBar, sliver: const GalleryTabBar())
                        ];
                      },
                      body:CustomScrollView(
                        physics: const ClampingScrollPhysics(),
                        slivers: [
                          SliverOverlapInjector(handle: appBar),
                          if (cubit.isGallery)
                            SliverOverlapInjector(handle: disconnectBar),
                          SliverToBoxAdapter(child: 15.ph),
                          cubit.screens[cubit.index]
                        ],
                      ),
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
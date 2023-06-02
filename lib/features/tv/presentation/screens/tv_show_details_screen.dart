import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/app/injection_container.dart'as di;
import 'package:mo3tv/config/lang/app_localizations.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/credits/presentation/cubits/credits_cubit.dart';
import 'package:mo3tv/features/credits/presentation/screens/media_credits_screen.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_navigator_cubit/gallery_navigator_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/screens/media_gallery_screen.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/gallery_tab_bar.dart';
import 'package:mo3tv/core/widgets/media_bottom_nav_bar.dart';
import 'package:mo3tv/features/reviews/presentation/cubits/reviews_cubit.dart';
import 'package:mo3tv/features/reviews/presentation/screens/media_reviews.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/recommendations_tv_cubit/recommendations_tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_bottomnav_cubit/tv_show_bottom_nav_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_bottomnav_cubit/tv_show_bottom_nav_state.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_buttons_bloc/tv_actions_bloc.dart';
import 'package:mo3tv/features/tv/presentation/widgets/recommendations/recommendations_tv.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_appbar_widget.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_overview/tv_show_overview.dart';
class TvShowDetailsScreen extends StatefulWidget {
  final TvShow tvShow;
  final String listType;
  const TvShowDetailsScreen({Key? key, required this.tvShow,this.listType=''}) : super(key: key);
  @override
  State<TvShowDetailsScreen> createState() => _TvShowDetailsScreenState();
}

class _TvShowDetailsScreenState extends State<TvShowDetailsScreen> {
  final SliverOverlapAbsorberHandle appBar = SliverOverlapAbsorberHandle();
  final SliverOverlapAbsorberHandle disconnectBar = SliverOverlapAbsorberHandle();
  ScrollController nestedController = ScrollController();
  late List<Widget> screens;
  @override
  void initState() {
    screens=[
      TvShowOverview(tvShow: widget.tvShow,listType:widget.listType),
      RecommendationsTvShows(tvId: widget.tvShow.id!),
      const MediaReviews(),
      const MediaCredits(),
      const MediaGalleryScreen(),
    ];
    super.initState();
  }
  @override
  void dispose() {
    nestedController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TvShowBottomNavCubit()),
        BlocProvider(create: (context) => di.sl<GalleryNavigatorCubit>()),
        BlocProvider(create: (context) => di.sl<TvCubit>()),
        BlocProvider(create: (context) => di.sl<TvActionsBloc>()),
        BlocProvider(create: (context) => di.sl<RecommendationsTvCubit>()),
        BlocProvider(create: (context) => di.sl<GalleryCubit>()),
        BlocProvider(create: (context) => di.sl<ReviewsCubit>()),
        BlocProvider(create: (context) => di.sl<CreditsCubit>()),
      ],
      child: Builder(
        builder: (context) {
          if(!TvCubit.get(context).isSuccess()){
            TvCubit.get(context).getTvShowDetailsData(tvShowId: widget.tvShow.id!,lang: AppLocalizations.of(context)!.getLang());
          }
          return BlocBuilder<TvShowBottomNavCubit, TvShowBottomNavStates>(
             builder: (context, state) {
              TvShowBottomNavCubit cubit = TvShowBottomNavCubit.get(context);
              return WillPopScope(
                onWillPop: () async{
                  if(cubit.index!=0)
                    {
                      cubit.changeScreen(0, context, widget.tvShow.id!);
                      return false;
                    }
                  else{
                    return true;
                  }
                },
                child: DefaultTabController(
                  length: 3,
                  child: SafeArea(
                      child: Scaffold(
                          backgroundColor: Theme.of(context).colorScheme.background,
                          body: NestedScrollView(
                            controller: nestedController,
                            headerSliverBuilder: (context, innerBoxIsScrolled) {
                              return [
                                SliverOverlapAbsorber(
                                  handle: appBar,
                                  sliver: SliverPersistentHeader(
                                    pinned: true,
                                    delegate: TvShowDetailsAppBar(
                                      widget.tvShow,
                                      onTap: () {
                                        nestedController.animateTo(0,
                                            duration:
                                                const Duration(milliseconds: 500),
                                            curve: Curves.ease);
                                      },
                                    ),

                                  ),
                                ),
                                if (cubit.isGallery)
                                  SliverOverlapAbsorber(
                                      handle: disconnectBar,
                                      sliver: GalleryTabBar(
                                        onTap: (value) {
                                          GalleryNavigatorCubit.get(context).gallery(value);
                                        },
                                      ))
                              ];
                            },
                            body: CustomScrollView(
                              physics: const ClampingScrollPhysics(),
                              slivers: [
                                SliverOverlapInjector(handle: appBar),
                                if (cubit.isGallery)
                                  SliverOverlapInjector(handle: disconnectBar),
                                SliverToBoxAdapter(child: 15.ph),
                                screens[cubit.index]
                              ],
                            ),
                          ),
                         bottomNavigationBar:  MediaBottomNav(
                          index: cubit.index,
                          onTap1: () {
                            nestedController.animateTo(0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                            cubit.changeScreen(0, context, widget.tvShow.id!);
                          },
                          onTap2: () {
                            nestedController.animateTo(0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                            cubit.changeScreen(1, context, widget.tvShow.id!);
                          },
                          onTap3: () {
                            nestedController.animateTo(0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                            cubit.changeScreen(2, context, widget.tvShow.id!);
                          },
                          onTap4: () {
                            nestedController.animateTo(0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                            cubit.changeScreen(3, context, widget.tvShow.id!);
                          },
                          onTap5: () {
                            nestedController.animateTo(0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                            cubit.changeScreen(
                                4, context, widget.tvShow.id!);
                          },

                        ),
                         ),),
                ),
              );
            },
          );
        }
      ),
    );
  }
}
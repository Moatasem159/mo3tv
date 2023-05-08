import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mo3tv/core/extension/empty_padding_extension.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/cubits/gallery_navigator_cubit/gallery_navigator_cubit.dart';
import 'package:mo3tv/features/gallery/presentation/widgets/gallery_tab_bar.dart';
import 'package:mo3tv/core/widgets/media_bottom_nav_bar.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_bottomnav_cubit/tv_show_bottom_nav_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_bottomnav_cubit/tv_show_bottom_nav_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_appbar_widget.dart';
class TvShowDetailsScreen extends StatefulWidget {
  final TvShow tvShow;
  const TvShowDetailsScreen({Key? key, required this.tvShow}) : super(key: key);
  @override
  State<TvShowDetailsScreen> createState() => _TvShowDetailsScreenState();
}

class _TvShowDetailsScreenState extends State<TvShowDetailsScreen> {
  final SliverOverlapAbsorberHandle appBar = SliverOverlapAbsorberHandle();
  final SliverOverlapAbsorberHandle disconnectBar = SliverOverlapAbsorberHandle();
  ScrollController nestedController = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nestedController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TvShowBottomNavCubit(),
      child: BlocBuilder<TvShowBottomNavCubit, TvShowBottomNavStates>(
         builder: (context, state) {
          TvShowBottomNavCubit cubit = BlocProvider.of<TvShowBottomNavCubit>(context);
          return DefaultTabController(
            length: 3,
            child: WillPopScope(
              onWillPop: () async {
                TvCubit.get(context).clearObjects();
                GalleryCubit.get(context).initial(context);
                TvCubit.get(context).backToBackTvShows();
                GoRouter.of(context).pop();
                return true;
              },
              child: SafeArea(
                  child: Scaffold(
                      resizeToAvoidBottomInset:false,
                      backgroundColor: Theme.of(context).colorScheme.background,
                      body: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          NestedScrollView(
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
                                cubit.screens[cubit.index]
                              ],
                            ),
                          ),
                          MediaBottomNav(
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
                            index: cubit.index,
                          ),
                        ],
                      ),
                     )),
            ),
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/gallery/gallery_tab_bar.dart';
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
  final SliverOverlapAbsorberHandle disconnectBar =
      SliverOverlapAbsorberHandle();
  ScrollController nestedController = ScrollController();

  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    nestedController.addListener(listen);
  }

  @override
  void dispose() {
    nestedController.removeListener(listen);
    nestedController.dispose();
    super.dispose();
  }

  void listen() {
    if (nestedController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      hide();
    } else if (nestedController.position.userScrollDirection ==
        ScrollDirection.forward) {
      show();
    }
  }

  void show() {
    if (!isVisible) {
      setState(() {
        isVisible = true;
      });
    }
  }

  void hide() {
    if (isVisible) {
      setState(() {
        isVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TvShowBottomNavCubit(),
      child: BlocConsumer<TvShowBottomNavCubit, TvShowBottomNavStates>(
        listener: (context, state) {},
        builder: (context, state) {
          TvShowBottomNavCubit cubit =
              BlocProvider.of<TvShowBottomNavCubit>(context);
          return DefaultTabController(
            length: 3,
            child: WillPopScope(
              onWillPop: () async {
                BlocProvider.of<TvCubit>(context).clearObjects();
                BlocProvider.of<TvCubit>(context).backToBackTvShows();
                Navigator.pop(context);
                return true;
              },
              child: SafeArea(
                  child: Scaffold(
                      backgroundColor: Theme.of(context).backgroundColor,
                      body: NestedScrollView(
                        controller: nestedController,
                        headerSliverBuilder: (context, innerBoxIsScrolled) {
                          return [
                            SliverOverlapAbsorber(
                              handle: appBar,
                              sliver: SliverPersistentHeader(
                                delegate: TvShowDetailsAppBar(
                                  widget.tvShow,
                                  onTap: () {
                                    show();
                                    nestedController.animateTo(0,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.ease);
                                  },
                                ),
                                pinned: true,
                              ),
                            ),
                            if (cubit.isGallery)
                              SliverOverlapAbsorber(
                                  handle: disconnectBar,
                                  sliver: GalleryTabBar(
                                    onTap: (value) {
                                      BlocProvider.of<TvCubit>(context)
                                          .gallery(value);
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
                            const SliverToBoxAdapter(
                              child: SizedBox(height: 15),
                            ),
                            cubit.screens[cubit.index]
                          ],
                        ),
                      ),
                      bottomNavigationBar: MediaBottomNavBar(
                        items: cubit.items,
                        index: cubit.index,
                        isVisible: isVisible,
                        onTap: (value) {
                          nestedController.animateTo(0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease);
                          cubit.changeScreen(value, context, widget.tvShow.id!);
                        },
                      ))),
            ),
          );
        },
      ),
    );
  }
}

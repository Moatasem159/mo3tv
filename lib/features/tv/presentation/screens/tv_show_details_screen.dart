import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/tv/domain/entities/tv_show.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_cubit/tv_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_bottomnav_cubit/tv_show_bottom_nav_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_show_bottomnav_cubit/tv_show_bottom_nav_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_show_appbar_widget.dart';

class TvShowDetailsScreen extends StatelessWidget {
  final TvShow tvShow;

  const TvShowDetailsScreen({Key? key, required this.tvShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SliverOverlapAbsorberHandle appBar = SliverOverlapAbsorberHandle();
    final SliverOverlapAbsorberHandle disconnectBar =
    SliverOverlapAbsorberHandle();
    return BlocProvider(
  create: (context) => TvShowBottomNavCubit(),
  child: BlocConsumer<TvShowBottomNavCubit, TvShowBottomNavStates>(
  listener: (context, state) {},
  builder: (context, state) {
    TvShowBottomNavCubit cubit = BlocProvider.of<TvShowBottomNavCubit>(context);
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
              body: NestedScrollView(
                physics: const ClampingScrollPhysics(),
                controller:cubit.controller ,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverOverlapAbsorber(
                      handle: appBar,
                      sliver: SliverPersistentHeader(
                        delegate: TvShowDetailsAppBar(tvShow),
                        pinned: true,
                      ),
                    ),
                    if(cubit.isGallery)
                      SliverOverlapAbsorber(handle: disconnectBar,
                      sliver: SliverAppBar(
                        pinned: true,
                        elevation: 10,
                        backgroundColor: Colors.black,
                        automaticallyImplyLeading: false,
                        toolbarHeight: 0,
                        bottom: PreferredSize(
                          preferredSize: const Size(0, 30),
                          child: TabBar(
                            indicatorWeight: 2,
                            indicatorColor: Colors.red,
                            labelPadding: const EdgeInsets.only(bottom: 5),
                            onTap: (value) {
                              BlocProvider.of<TvCubit>(context).gallery(value,tvShow.id);
                            },
                            tabs: const [
                              Text("Backdrops"),
                              Text("posters"),
                              Text("logos"),
                              // Text("Videos"),
                            ],
                          ),
                        ),
                      ),)
                  ];
                },
                body: Builder(builder: (context) {
                  return CustomScrollView(
                    slivers: [
                      SliverOverlapInjector(handle: appBar),
                      if(cubit.isGallery)
                        SliverOverlapInjector(handle: disconnectBar),
                      const SliverToBoxAdapter(
                        child: SizedBox(height: 15),
                      ),
                      BlocBuilder<TvShowBottomNavCubit,TvShowBottomNavStates>(
                        builder: (context, state) {
                      return BlocProvider.of<TvShowBottomNavCubit>(context)
                              .screens[
                          BlocProvider.of<TvShowBottomNavCubit>(context).index];
                    },
                      ),
                    ],
                  );
                }),
              ),
              bottomNavigationBar:NavigationBar(
                elevation: 3,
                backgroundColor: Colors.black12,
                surfaceTintColor: Colors.black45,
                height: 60,
                animationDuration: const Duration(seconds: 2),
                labelBehavior: NavigationDestinationLabelBehavior
                    .alwaysShow,
                destinations: cubit.items,
                selectedIndex: cubit.index,
                onDestinationSelected: (value) {
                  cubit.changeScreen(value, context, tvShow.id!);
                },
              )
            )),
      ),
    );
  },
),
);
  }
}

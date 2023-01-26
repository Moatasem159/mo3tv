import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_tab_bar_cubit/tv_tab_bar_cubit.dart';
import 'package:mo3tv/features/tv/presentation/cubit/tv_tab_bar_cubit/tv_tab_bar_state.dart';
import 'package:mo3tv/features/tv/presentation/widgets/tv_appbar_widget.dart';

class TvScreen extends StatelessWidget {
  const TvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SliverOverlapAbsorberHandle appBar = SliverOverlapAbsorberHandle();
    final SliverOverlapAbsorberHandle disconnectBar = SliverOverlapAbsorberHandle();
    return BlocProvider(
      create: (context) => TvTabBarCubit(),
      child: BlocConsumer<TvTabBarCubit, TvTabBarStates>(
        listener: (context, state) {},
        builder: (context, state) {
          TvTabBarCubit cubit=BlocProvider.of(context);
          return DefaultTabController(
            length: 3,
            child: NestedScrollView(
                physics: const NeverScrollableScrollPhysics(),
                headerSliverBuilder: (BuildContext context,
                    bool innerBoxIsScrolled) {
                  return [
                    TvAppbar(handle: appBar),
                    SliverOverlapAbsorber(handle: disconnectBar,
                      sliver: SliverPersistentHeader(
                          pinned: true,
                          delegate: TvTabBarDelegate()),),
                  ];
                },
                body: CustomScrollView(
                    slivers: [
                      SliverOverlapInjector(
                          handle: appBar
                      ),
                      SliverOverlapInjector(
                          handle: disconnectBar
                      ),
                      cubit.lists[cubit.index]

                    ]
                )
            ),
          );
        },
      ),
    );
  }
}
class TvTabBarDelegate extends SliverPersistentHeaderDelegate{
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(
      children: [
        const SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            height: 27,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25.0)
            ),
            child:TabBar(
              splashFactory: NoSplash.splashFactory,
              splashBorderRadius: BorderRadius.zero,
              overlayColor: MaterialStateProperty.all(const Color(0x00000000)),
              indicator: BoxDecoration(
                  color: Colors.red,
                  borderRadius:  BorderRadius.circular(25.0)
              ) ,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              tabs: const  [
                Tab(text: 'Trending',),
                Tab(text: 'Popular',),
                Tab(text: 'Top rated',),
              ],
              onTap: (value) {
                BlocProvider.of<TvTabBarCubit>(context).changeIndex(value,context);
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 40;

  @override
  double get minExtent =>40;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate)=>false;

}
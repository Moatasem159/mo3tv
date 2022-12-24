import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo3tv/core/widgets/textformfield.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_cubit.dart';
import 'package:mo3tv/features/search/presentation/cubit/search_state.dart';
import 'package:mo3tv/features/search/presentation/widgets/search_list.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SliverOverlapAbsorberHandle appBar = SliverOverlapAbsorberHandle();
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state) {},
      builder: (context, state) {
        SearchCubit cubit=BlocProvider.of<SearchCubit>(context);
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return[
                SliverAppBar(
                  backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                  title: const Text("Mo3Tv"),
                ),
                SliverOverlapAbsorber(
                    handle: appBar,
                  sliver:SliverPersistentHeader(
                    pinned: true,
                      delegate: SearchBar(
                    searchBar: Container(
                      color: Theme.of(context).backgroundColor,
                      child: Column(
                        children: [
                          MainTextFormField(
                            controller: cubit.controller,
                            hintText: 'search for a movie, tv show, person...',
                            focusedBorderColor: Colors.white,
                            prefixIcon: Icons.search,
                            onChange: (word) {
                              if (word.isNotEmpty && word.length >= 2) {
                                cubit.search(word: word);
                              }
                              else{
                                cubit.clearList();
                              }
                            },
                            suffixIcon: GestureDetector(
                              onTap: () {
                                cubit.clear();
                              },
                                child: const Icon(Icons.clear, color: Colors.white)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ))),
              ];
            },
            body: Builder(
              builder: (context) {
                return CustomScrollView(
                  physics: const ClampingScrollPhysics(),
                  slivers: [
                    SliverOverlapInjector(
                      handle: appBar,
                    ),
                    if(cubit.items.isNotEmpty)
                      SearchList(items: cubit.items),
                    if(state is SearchSuccessState&&cubit.items.isEmpty)
                      const SliverToBoxAdapter(
                        child: Center(
                          child: Text("No Results",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
                          ),
                        ),
                      )
                  ],
                );
              }
            ),
          )
        );
      },
    );
  }
}

class SearchBar extends SliverPersistentHeaderDelegate{
  final Widget searchBar;

  SearchBar({required this.searchBar});
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
   return searchBar;
  }

  @override
  double get maxExtent =>60;

  @override
  double get minExtent =>60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>false;

}

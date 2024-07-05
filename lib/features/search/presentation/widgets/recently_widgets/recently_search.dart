part of '../../screens/search_screen.dart';

class _RecentlySearch extends StatelessWidget {
  const _RecentlySearch();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchListCubit, SearchListStates>(
      builder: (context, state) {
        if (SearchListCubit.get(context).recently.isNotEmpty) {
          return SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const _ClearButton(),
                _RecentlySearchList(SearchListCubit.get(context).recently)
              ],
            ).addSymmetricPadding(h: 20, v: 5),
          );
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}
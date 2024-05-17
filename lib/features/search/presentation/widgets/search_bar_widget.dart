part of'../screens/search_screen.dart';
class _SearchBarWidget extends StatelessWidget {
  const _SearchBarWidget();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchStates>(
      builder: (context, state) {
        SearchBloc cubit = SearchBloc.get(context);
        return SliverAppBar(
          pinned: true,
          elevation: 0,
          expandedHeight: 70,
          toolbarHeight: 70,
          flexibleSpace: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            color: Theme.of(context).colorScheme.surface,
            child: MainTextFormField(
              controller: cubit.controller,
              hintText: AppStrings.searchDialog.tr(context)!,
              focusedBorderColor: Colors.white,
              prefixIcon: Icons.search,
              onChange: (query) {
                cubit.add(SearchEvent(query,AppLocalizations.of(context)!.getLang()));
                if (query.isEmpty) {
                  SearchListCubit.get(context).getSearchList();
                }
              },
              suffixIcon: GestureDetector(
                  onTap: () {
                    cubit.add(ClearEvent());
                    SearchListCubit.get(context).getSearchList();
                  },
                  child: const Icon(Icons.clear, color: Colors.white)),
            ),
          ),
        );
      },
    );
  }
}
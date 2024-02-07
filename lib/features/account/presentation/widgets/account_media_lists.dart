part of'../screens/account_media_list_screen.dart';
class _AccountList extends StatelessWidget {
  final String mediaType;
  final String listType;
  const _AccountList({required this.mediaType,required this.listType});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountListsCubit,AccountListsStates>(
      builder: (context, state) {
        AccountListsCubit cubit = AccountListsCubit.get(context);
        if(state is GetAccountListsLoadingState&&state.isFirstLoading)
        {
          return const SliverMediaLoadingList();
        }
        if(cubit.list.isEmpty)
        {
          return _EmptyAccountList(mediaType=="movies"?AppStrings.noMovies:AppStrings.noTvShows);
        }
        if(cubit.list.isNotEmpty)
        {
          return MediaVerticalList(mediaList: cubit.list,listType:listType,mediaType:mediaType);
        }
        if(state is GetAccountListsErrorState)
        {
          return SliverToBoxAdapter(child: ErrorButton(onTap: () => cubit.getAccountList(mediaType:mediaType,listType:listType)));
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}
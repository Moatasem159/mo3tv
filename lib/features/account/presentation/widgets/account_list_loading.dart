part of'../screens/account_media_list_screen.dart';
class _AccountListLoading extends StatelessWidget {
  const _AccountListLoading();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountListsCubit, AccountListsStates>(
      builder: (context, state) {
        if(state is GetAccountListsLoadingState &&!state.isFirstLoading) {
          return const SliverLoadingIndicator();
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}
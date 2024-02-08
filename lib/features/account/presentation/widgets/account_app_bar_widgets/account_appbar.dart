part of'../../screens/account_screen.dart';
class _AccountAppBar extends StatelessWidget {
  const _AccountAppBar();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountCubit(di.sl())..getAccountDetails(),
      child: BlocBuilder<AccountCubit, AccountStates>(
        builder: (context, state) {
          if (state is GetAccountsDetailsSuccessState) {
            return _AccountAppBarWidget(state.account);
          }
          if(state is GetAccountsDetailsErrorState)
            {
              return const SizedBox();
            }
          return const _AccountAppBarLoadingWidget();
        },
      ),
    );
  }
}
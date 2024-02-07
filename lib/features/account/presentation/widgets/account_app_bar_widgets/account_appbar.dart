part of'../../screens/account_screen.dart';
class _AccountAppBar extends StatelessWidget {
  const _AccountAppBar();
  @override
  Widget build(BuildContext context) {
    if(AppStrings.sessionId!="") {
      return BlocProvider(
      create: (context) => AccountCubit(di.sl())..getAccountDetails(),
      child: BlocBuilder<AccountCubit, AccountStates>(
        builder: (context, state) {
          if (state is GetAccountsDetailsSuccessState) {
            return _AccountAppBarWidget(state.account);
          }
          return const _AccountAppBarLoadingWidget();
        },
      ),
    );
    }
    return const SizedBox();
  }
}
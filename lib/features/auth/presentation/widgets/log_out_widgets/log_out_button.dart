part of'../login_widgets/login_button.dart';
class _LogoutButton extends StatelessWidget {
  const _LogoutButton();
  @override
  Widget build(BuildContext context) {
    return MainButton(
        radius: 5,
        size: Size(MediaQuery.of(context).size.width - 250, 35),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(
                    AppStrings.logoutOfYourAccount.tr(context)!,
                    style: AppTextStyles.get14NormalText()),
                actions: [
                  TextButton(
                      onPressed: GoRouter.of(context).pop,
                      child: Text(AppStrings.cancel.tr(context)!,
                          style: AppTextStyles.get14NormalText())),
                  TextButton(
                      onPressed: () {
                        LogCubit.get(context).logOut();
                        GoRouter.of(context).pop();
                      },
                      child: Text(AppStrings.logout.tr(context)!,
                          style: AppTextStyles.get14NormalText(
                              color: Colors.red)))
                ],
              );
            },
          );
        },
        label: AppStrings.logout.tr(context)!);
  }
}
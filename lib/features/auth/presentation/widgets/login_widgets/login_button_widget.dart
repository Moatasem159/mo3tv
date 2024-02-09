part of'login_button.dart';
class _LoginButtonWidget extends StatelessWidget {
  const _LoginButtonWidget();
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)),
      onPressed:()async=>await LogCubit.get(context).getToken(),
      child:Text(AppStrings.loginToEnjoyFullExperience.tr(context)!,style: AppTextStyles.get14NormalText()),
    );
  }
}
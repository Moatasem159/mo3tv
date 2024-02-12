part of'login_button.dart';
class LoginDialog extends StatelessWidget {
  const LoginDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:Text(AppStrings.loginSuccessfully.tr(context)!,style: AppTextStyles.get14NormalText()),
      content:Text(AppStrings.loginSuccessfullyDialog.tr(context)!,style: AppTextStyles.get14NormalText()),
      actions: [
        TextButton(
          onPressed:(){
            context.pop();
            context.goNamed(Routes.genresRoute);
          },
          child:Text(AppStrings.ok.tr(context)!,style: AppTextStyles.get14NormalText()),
        )
      ],
    );
  }
}
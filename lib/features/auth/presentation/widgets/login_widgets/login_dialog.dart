part of'login_button.dart';
class _LoginDialog extends StatelessWidget {
  const _LoginDialog();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:Text(AppStrings.loginSuccessfully.tr(context)!,style: AppTextStyles.get14NormalText()),
      content:Text(AppStrings.loginSuccessfullyDialog.tr(context)!,style: AppTextStyles.get14NormalText()),
      actions: [
        TextButton(
          onPressed:(){
            context.pop();
            context.goNamed(Routes.movieRoute);
          },
          child:Text(AppStrings.ok.tr(context)!,style: AppTextStyles.get14NormalText()),
        )
      ],
    );
  }
}
part of'login_button.dart';
class LoginDialog extends StatelessWidget {
  final bool inOnBoarding;
  const LoginDialog({super.key, required this.inOnBoarding});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:Text(AppStrings.loginSuccessfully.tr(context)!,style: AppTextStyles.get14NormalText()),
      content:Text(AppStrings.loginSuccessfullyDialog.tr(context)!,style: AppTextStyles.get14NormalText()),
      actions: [
        TextButton(
          onPressed:(){
            context.pop();
            if(inOnBoarding)
              {
                context.goNamed(Routes.genresRoute);
              }
            else{
              context.pushNamed(Routes.genresRoute);
            }
          },
          child:Text(AppStrings.ok.tr(context)!,style: AppTextStyles.get14NormalText()),
        )
      ],
    );
  }
}
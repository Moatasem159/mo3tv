part of'login_button.dart';
class LoginDialog extends StatelessWidget {
  final bool ?inOnBoarding;
  const LoginDialog({super.key, this.inOnBoarding=false});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:Text(AppStrings.loginSuccessfully.tr(context)!,style: AppTextStyles.get14NormalText()),
      content:Text(AppStrings.loginSuccessfullyDialog.tr(context)!,style: AppTextStyles.get14NormalText()),
      actions: [
        TextButton(
          onPressed:(){
            context.pop();
            if(inOnBoarding==true){

            }else{
              context.goNamed(Routes.movieRoute);
            }
          },
          child:Text(AppStrings.ok.tr(context)!,style: AppTextStyles.get14NormalText()),
        )
      ],
    );
  }
}
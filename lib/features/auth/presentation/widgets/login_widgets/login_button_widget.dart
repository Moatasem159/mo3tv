part of 'login_button.dart';
class _LoginButtonWidget extends StatelessWidget {
  const _LoginButtonWidget();
  @override
  Widget build(BuildContext context) {
    return MainButton(
      size: const Size(240, 30),
      onPressed: () async => await LogCubit.get(context).getToken(),
      label: AppStrings.loginToEnjoyFullExperience.tr(context)!,
    );
  }
}
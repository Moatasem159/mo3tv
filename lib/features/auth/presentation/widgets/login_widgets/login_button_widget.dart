part of 'login_button.dart';

class _LoginButtonWidget extends StatelessWidget {
  const _LoginButtonWidget();

  @override
  Widget build(BuildContext context) {
    return MainButton(
      size: const Size(240, 35),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      onPressed: () async => await LogCubit.get(context).getToken(),
      label: AppStrings.loginToEnjoyFullExperience.tr(context)!,
    );
  }
}
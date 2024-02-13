part of'../../screens/on_boarding_screen.dart';
class _RegisterButton extends StatelessWidget {
  const _RegisterButton();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(_) => LogCubit(sl(), sl(), sl()),
      child: BlocConsumer<LogCubit,LogStates>(
        listener: (context, state) {
          if (state is GetSessionIdSuccessState) {
            AccountCubit.get(context).getAccountDetails();
            showDialog(context: context,
                barrierDismissible: false,
                builder: (_) => const LoginDialog(inOnBoarding: true));
          }
          if (state is GetTokenSuccessState) {
            context.pushNamed(Routes.loginRoute, extra: LogCubit.get(context),pathParameters: {"token":LogCubit.get(context).token.token});
          }
        },
        builder: (context, state) {
          if (state is GetTokenLoadingState || state is GetSessionIdLoadingState||state is LogOutLoadingState) {
            return Positioned(
                top: context.height/1.15,
                left: context.width/2.24,
                child: const CircularProgressIndicator(
                strokeWidth: 1,
                ));
          }
          return Positioned(
            top: context.height/1.17,
            left: context.width/6.1,
            child: MainButton(
              radius: 15,
              overlayColor: Colors.white24,
              size: const Size(240, 30),
              color: Colors.white54,
              textStyle: AppTextStyles.get14BoldText(),
              onPressed: () async => await LogCubit.get(context).getToken(),
              label: AppStrings.loginToEnjoyFullExperience.tr(context)!,
            ),
          );
        }),
    );
  }
}
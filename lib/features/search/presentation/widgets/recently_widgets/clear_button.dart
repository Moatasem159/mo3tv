part of'../../screens/search_screen.dart';
class _ClearButton extends StatelessWidget {
  const _ClearButton();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(AppStrings.recent.tr(context)!,style: AppTextStyles.get14BoldText()),
        const Spacer(),
        GestureDetector(
          onTap: () =>SearchListCubit.get(context).clearSearch(),
            child:Text(AppStrings.clear.tr(context)!,style: AppTextStyles.get14NormalText(color: Theme.of(context).primaryColor))),
      ],
    );
  }
}
part of'../screens/search_screen.dart';
class _SearchEmptyWidget extends StatelessWidget {
  const _SearchEmptyWidget();
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
         child: Text(
           AppStrings.noResults.tr(context)!,
           style: AppTextStyles.get18BoldText())),
    );
  }
}
part of'../screens/media_reviews.dart';
class _ReviewEmptyWidget extends StatelessWidget {
  const _ReviewEmptyWidget();
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
          children:  [
            (MediaQuery.sizeOf(context).height*.18).ph,
            const Icon(Icons.comments_disabled_outlined, size: 70),
            Text(AppStrings.noReviews.tr(context)!, style: AppTextStyles.get25BoldText())
          ],
        ),
    );
  }
}
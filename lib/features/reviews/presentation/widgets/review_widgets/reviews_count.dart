part of'../../screens/media_reviews.dart';
class _ReviewsCount extends StatelessWidget {
  final int reviews;
  const _ReviewsCount(this.reviews);
  @override
  Widget build(BuildContext context) {
    return Text("${AppStrings.reviews.tr(context)!} : $reviews",
        style: AppTextStyles.get18BoldText(height: 0)).addSymmetricPadding(h: 11);
  }
}
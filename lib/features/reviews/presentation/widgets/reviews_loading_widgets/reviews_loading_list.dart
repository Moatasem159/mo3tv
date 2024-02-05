part of'../../screens/media_reviews.dart';
class _ReviewsLoadingList extends StatelessWidget {
  const _ReviewsLoadingList();
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (_,__) =>const _ReviewLoadingWidget()
          ),
        ],
      ),
    );
  }
}
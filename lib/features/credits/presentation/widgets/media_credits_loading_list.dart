part of '../screens/media_credits_screen.dart';
class _MediaCreditsLoadingList extends StatelessWidget {
  const _MediaCreditsLoadingList();
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount:10,
      itemBuilder:(_,__) =>Shimmer.fromColors(
        baseColor: Colors.grey[700]!,
        highlightColor: Colors.grey[600]!,
        child: Container(
          height: 170.0,
          width: 115.0,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ).addSymmetricPadding(h: 5),
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio:0.65,crossAxisCount:3,mainAxisSpacing:7),
    );
  }
}

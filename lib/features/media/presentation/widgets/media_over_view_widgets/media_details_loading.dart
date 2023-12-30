part of 'media_overview.dart';
class _MediaDetailsLoading extends StatelessWidget {
  final String mediaType;
  const _MediaDetailsLoading({required this.mediaType});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Lottie.asset(
          mediaType == AppStrings.movie
              ? AppAssets.movieLoading
              : AppAssets.tvLoading,
          height: 80,
        ),
      ),
    );
  }
}
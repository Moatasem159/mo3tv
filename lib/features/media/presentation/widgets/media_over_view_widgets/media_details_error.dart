part of'media_overview.dart';
class _MediaDetailsError extends StatelessWidget {
  const _MediaDetailsError();
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: ErrorButton(onTap:GetMediaDetailsCubit.get(context).getMovieDetailsData));
  }
}
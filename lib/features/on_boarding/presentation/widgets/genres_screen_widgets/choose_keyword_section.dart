part of'../../screens/genres_screen.dart';
class _ChooseKeywordSection extends StatelessWidget {
  const _ChooseKeywordSection();
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.height / 4,
      child:Column(
        children: [
          const ChooseKeywordTitle(),
          10.ph,
          const _KeywordListWidget(title: AppStrings.moviesGenres,isMovie:true),
          (context.height /18).ph,
          const _KeywordListWidget(title: AppStrings.tvShowsGenres,isMovie: false),
          (context.height /6).ph,
          const _FinishButton()
        ],
      ),
    );
  }
}
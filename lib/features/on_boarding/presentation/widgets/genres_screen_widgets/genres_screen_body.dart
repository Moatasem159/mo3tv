part of'../../screens/genres_screen.dart';
class _GenresScreenBody extends StatelessWidget {
  const _GenresScreenBody();
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        BackgroundImage(AppAssets.genresBackground),
        _AppLogo(),
        _GenresScreenTitle(),
        _ChooseKeywordSection(),
      ],
    );
  }
}
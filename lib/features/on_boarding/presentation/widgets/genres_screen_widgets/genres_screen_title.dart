part of'../../screens/genres_screen.dart';
class _GenresScreenTitle extends StatefulWidget {
  const _GenresScreenTitle();
  @override
  State<_GenresScreenTitle> createState() => _GenresScreenTitleState();
}
class _GenresScreenTitleState extends State<_GenresScreenTitle>with SingleTickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<Offset> _slideTransition;
  late CurvedAnimation _curveAnimations;
  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(vsync: this, duration: const Duration(milliseconds: 2500));
    _curveAnimations = CurvedAnimation(parent:_slideController,curve: Curves.fastLinearToSlowEaseIn);
    _slideTransition = Tween<Offset>(begin: const Offset(15, 0), end: Offset.zero).animate(_curveAnimations);
    _slideController.forward();
  }
  @override
  void dispose() {
    _slideController.dispose();
    _curveAnimations.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: context.height / 5.5,
        left: AppLocalizations.of(context)!.isEnLocale?context.width / 4.18:context.width /3.62,
        child: SlideTransition(
            position: _slideTransition,
            child: Text(AppStrings.chooseYourGenres.tr(context)!,style: AppTextStyles.get18BoldText())));
  }
}
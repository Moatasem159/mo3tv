part of'../../screens/genres_screen.dart';
class ChooseKeywordTitle extends StatefulWidget {
  const ChooseKeywordTitle({super.key});
  @override
  State<ChooseKeywordTitle> createState() => _ChooseKeywordTitleState();
}
class _ChooseKeywordTitleState extends State<ChooseKeywordTitle>with SingleTickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<Offset> _slideTransition;
  late CurvedAnimation _curveAnimations;
  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
    _curveAnimations = CurvedAnimation(parent: _slideController, curve: Curves.fastLinearToSlowEaseIn);
    _slideTransition = Tween<Offset>(begin:  Offset(AppStrings.appLang=="en"?-80:80, 0), end: Offset.zero).animate(_curveAnimations);
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
    return SlideTransition(
      position: _slideTransition,
      child: Container(
        padding:const EdgeInsets.symmetric(horizontal: 20),
        width: context.width,
        child: Text(AppStrings.chooseKeywordTitle.tr(context)!,style: AppTextStyles.get18BoldText(height: 0)),
      ),
    );
  }
}
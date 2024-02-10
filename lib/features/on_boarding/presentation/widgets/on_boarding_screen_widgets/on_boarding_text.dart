part of'../../screens/on_boarding_screen.dart';
class _OnBoardingText extends StatelessWidget {
  final String title;
  final bool ?isTitle;
  const _OnBoardingText({required this.title,this.isTitle=true});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.width/33),
      width: context.width,
      child: Text(title.tr(context)!,style:isTitle!? AppTextStyles.get25BoldText():AppTextStyles.get18NormalText()),
    );
  }
}
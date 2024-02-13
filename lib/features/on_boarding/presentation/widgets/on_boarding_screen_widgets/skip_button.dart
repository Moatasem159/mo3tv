part of'../../screens/on_boarding_screen.dart';
class _SkipButton extends StatelessWidget {
  final PageController controller;
  const _SkipButton(this.controller);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: context.width/13,
      top: context.height/11.6,
      child: Material(
        color: Colors.transparent,
        borderRadius:BorderRadius.circular(10),
        child: InkWell(
          onTap:()=> controller.jumpToPage(2),
          borderRadius:BorderRadius.circular(10),
          child: Container(
            width:60,
            height:30,
            alignment: Alignment.center,
            decoration:  BoxDecoration(
                color: Colors.white24,
                borderRadius:BorderRadius.circular(10)
            ),
            child: Text(AppStrings.skip.tr(context)!,style: AppTextStyles.get18BoldText()),
          ),
        ),
      ),
    );
  }
}
part of'../../screens/on_boarding_screen.dart';
class _SkipButton extends StatelessWidget {
  const _SkipButton();
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: context.height/5,
      child: Material(
        color: Colors.transparent,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
        child: InkWell(
          onTap:()=>context.goNamed(Routes.movieRoute),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
          child: Container(
            width:70,
            height:30,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                )
            ),
            child: Text(AppStrings.skip.tr(context)!,style: AppTextStyles.get18BoldText()),
          ),
        ),
      ),
    );
  }
}
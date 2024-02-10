part of'../../screens/on_boarding_screen.dart';
class _OnBoardingScreenBody extends StatefulWidget {
  const _OnBoardingScreenBody();
  @override
  State<_OnBoardingScreenBody> createState() => _OnBoardingScreenBodyState();
}
class _OnBoardingScreenBodyState extends State<_OnBoardingScreenBody> {
  late final PageController controller;
  late final List<String> images;
  late final List<String> titles;
  late final List<String> subTitles;
  late int currentPage;
  @override
  void initState() {
    super.initState();
    controller=PageController();
    images=[
      AppAssets.onBoarding1,
      AppAssets.onBoarding2,
      AppAssets.onBoarding3
    ];
    titles=[
      AppStrings.onBoardingTitle1,
      AppStrings.onBoardingTitle2,
      AppStrings.onBoardingTitle3
    ];
    subTitles=[
      AppStrings.onBoardingSubTitle1,
      AppStrings.onBoardingSubTitle2,
      AppStrings.onBoardingSubTitle3
    ];
    currentPage=0;
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          itemCount: 3,
          controller: controller,
          onPageChanged: (value) {
            setState(() {
              currentPage=value;
            });
          },
          itemBuilder: (_, index) => _OnBoardingPage(image: images[index], title: titles[index], subtitle: subTitles[index],index: index),
        ),
        if(currentPage!=2)
        const _SkipButton(),
        _CustomDots(controller),
        Positioned(
          top: context.height/1.25,
          left: context.width / 2.82,
          child: MainButton(
            onPressed:(){
              if(currentPage!=2)
              {
                controller.animateToPage(++currentPage,duration: const Duration(milliseconds: 400),curve: Curves.ease);
              }
              else{
                context.goNamed(Routes.movieRoute);
              }
            },
            color: Colors.white54,
            textStyle: AppTextStyles.get14BoldText(),
            label:currentPage!=2?AppStrings.next.tr(context)!:AppStrings.skip.tr(context)!,
            radius: 15,
            overlayColor: Colors.white24,
            size: const Size(100, 30),
          ),
        ),
        if(currentPage==2)
        const _RegisterButton()
      ],
    );
  }
}

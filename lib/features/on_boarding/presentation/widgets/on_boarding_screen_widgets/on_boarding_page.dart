part of'../../screens/on_boarding_screen.dart';
class _OnBoardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final int index;
  const _OnBoardingPage({required this.image, required this.title, required this.subtitle, required this.index});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _OnBoardingImage(image),
        Positioned(
          top:index==0?context.height/1.8:index==1?context.height/2.3:context.height/1.6,
          child: Column(
            children: [
              _OnBoardingText(title: title),
              10.ph,
              _OnBoardingText(title: subtitle,isTitle: false),
            ],
          ),
        ),
      ],
    );
  }
}
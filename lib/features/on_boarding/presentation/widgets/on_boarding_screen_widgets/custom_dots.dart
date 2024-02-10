part of'../../screens/on_boarding_screen.dart';
class _CustomDots extends StatelessWidget {
  final PageController controller;
  const _CustomDots(this.controller);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.height/10.5,
      left: context.width/15,
      child: SmoothPageIndicator(
        controller: controller,
        count: 3,
        effect: const ExpandingDotsEffect(
            dotWidth: 13,
            dotHeight: 10,
            expansionFactor: 2,
            activeDotColor: Colors.white54,
            dotColor: Colors.white24),
      ),
    );
  }
}
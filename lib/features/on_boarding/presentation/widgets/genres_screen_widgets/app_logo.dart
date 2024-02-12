part of'../../screens/genres_screen.dart';
class _AppLogo extends StatefulWidget {
  const _AppLogo();
  @override
  State<_AppLogo> createState() => _AppLogoState();
}
class _AppLogoState extends State<_AppLogo> with SingleTickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<Offset> _slideTransition;
  late CurvedAnimation _curveAnimations;
  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(vsync: this, duration: const Duration(milliseconds: 2500));
    _curveAnimations = CurvedAnimation(parent: _slideController, curve: Curves.fastLinearToSlowEaseIn);
    _slideTransition = Tween<Offset>(begin: const Offset(0, -20), end: Offset.zero).animate(_curveAnimations);
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
      left: context.width / 2.95,
      top: context.height / 18,
      child: SlideTransition(
        position: _slideTransition,
        child: Container(
          width: context.width / 3,
          height: context.height / 6,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AppAssets.appLogo),
            ),
          ),
        ),
      ),
    );
  }
}
part of'../../../screens/genres_screen.dart';
class _KeywordListWidget extends StatefulWidget {
  final String title;
  final bool isMovie;
  const _KeywordListWidget({required this.title, required this.isMovie});
  @override
  State<_KeywordListWidget> createState() => _KeywordListWidgetState();
}
class _KeywordListWidgetState extends State<_KeywordListWidget> with SingleTickerProviderStateMixin{
  late AnimationController _slideController;
  late Animation<Offset> _slideTransition;
  late CurvedAnimation _curveAnimations;
  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    _curveAnimations = CurvedAnimation(parent: _slideController, curve: Curves.fastLinearToSlowEaseIn);
    _slideTransition = Tween<Offset>(begin: Offset(AppStrings.appLang=="en"?30:-30, 0), end: Offset.zero).animate(_curveAnimations);
    Future.delayed(const Duration(milliseconds:1000)).then((_){
      _slideController.forward();
    });
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _KeywordListTitle(widget.title),
          _KeywordsList(widget.isMovie),
        ],
      ),
    );
  }
}
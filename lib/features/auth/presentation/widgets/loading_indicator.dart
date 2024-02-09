part of'login_widgets/login_button.dart';
class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      margin: const EdgeInsets.all(15),
      height: 30,
      child: CircularProgressIndicator(strokeWidth: 1,color: Theme.of(context).primaryColor));
  }
}
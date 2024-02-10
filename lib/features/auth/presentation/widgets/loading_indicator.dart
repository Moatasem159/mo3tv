part of'login_widgets/login_button.dart';
class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 30,
        height: 30,
        margin: const EdgeInsets.all(15),
        child: CircularProgressIndicator(strokeWidth: 1,color: Theme.of(context).primaryColor));
  }
}
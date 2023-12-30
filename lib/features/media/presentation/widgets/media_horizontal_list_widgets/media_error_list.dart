part of 'media_list.dart';
class _MediaErrorList extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const _MediaErrorList({required this.title, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height/3.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _ListTitle(title: title),
          15.ph,
          ErrorButton(onTap: onPressed)
        ],
      ),
    );
  }
}
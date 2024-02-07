part of'../../screens/account_screen.dart';
class _AccountAppBarLoadingWidget extends StatelessWidget {
  const _AccountAppBarLoadingWidget();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[700]!,
          highlightColor: Colors.grey[600]!,
          child: Container(
            height:70,
            width:70,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration:const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey
            ),
          ),
        ),
        Shimmer.fromColors(
            baseColor: Colors.grey[700]!,
            highlightColor: Colors.grey[600]!,
            child: Container(
              width: 230,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey,
              ),
            )),
      ],
    );
  }
}
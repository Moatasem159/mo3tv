part of 'playing_now_media.dart';
class _PlayingNowMediaLoadingCard extends StatelessWidget {
  const _PlayingNowMediaLoadingCard();
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[850]!,
      highlightColor: Colors.grey[700]!,
      child: Container(
        height: MediaQuery.of(context).size.height/3.5,
        width: MediaQuery.of(context).size.width-50,
        decoration: BoxDecoration(
          color:Colors.grey,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
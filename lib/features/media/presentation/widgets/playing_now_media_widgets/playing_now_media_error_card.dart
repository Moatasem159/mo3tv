part of 'playing_now_media.dart';
class PlayingNowMediaErrorCard extends StatelessWidget {
  final  VoidCallback onPressed;
  const PlayingNowMediaErrorCard({super.key,required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height/3.5,
        width: MediaQuery.of(context).size.width-50,
        decoration: BoxDecoration(
          color:Colors.grey[700],
          borderRadius: BorderRadius.circular(15),
        ),
        child:ErrorButton(onTap: onPressed)
      ),
    );
  }
}

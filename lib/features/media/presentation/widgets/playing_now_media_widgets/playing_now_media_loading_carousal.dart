part of'playing_now_media.dart';
class _PlayingNowMediaLoadingCarousal extends StatelessWidget {
  const _PlayingNowMediaLoadingCarousal();
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height / 3.5,
        viewportFraction: .89,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
      ),
      items: const [_PlayingNowMediaLoadingCard()],
    );
  }
}
